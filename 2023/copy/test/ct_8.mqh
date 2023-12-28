//+------------------------------------------------------------------+
//|                                                          Cct.mqh |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

#include <Object.mqh>
//#include <Math\Stat\stat.mqh>

#define OBJECT_NAME(x) #x+" "   // macro for displaying an object name

class Cprices { public: double o,h,l,c; };
typedef Cprices (*Tp)(double,double,double,double);
void Prices(double O,double H,double L,double C, Cprices &P) { P.o=O; P.h=H; P.l=L; P.c=C; }

typedef string (*Tid)(int,double);
typedef string (*Tdd)(double,double);

string int_double(int A,double B) { return((string(IntegerToString(A)+"|"+DoubleToString(B)))); }
string double_double(double A,double B) { return(DoubleToString(A)+"|"+DoubleToString(B)); }
//+------------------------------------------------------------------+
//| ELEMENT CLASS                                                    |
//+------------------------------------------------------------------+
template <typename T>
class CElement                      : public CObject
   {
      protected:
      
      int                           cardinal;
      T                             element[];
      
      public:
      
      bool                          Cardinality(int Value) { if(Value>=0 && Value<INT_MAX) { cardinal=Value; ArrayResize(element,cardinal); return(true); } return(false); }
      int                           Cardinality() { return(cardinal); }
      
      bool                          Get(int ElementIdentity,T &Type) { if(ElementIdentity>=0 && ElementIdentity<Cardinality()) { Type=element[ElementIdentity]; return(true); } return(false); }
      bool                          Set(int ValueIndex,T Value) { if(ValueIndex>=0 && ValueIndex<Cardinality()) { element[ValueIndex]=Value; return(true); } return(false); }
      
      void                          Let()
                                    {
                                       this.Cardinality(0);
                                    };
                                    
                                    CElement(void)
                                    {
                                       Cardinality(0);
                                    };
                                    ~CElement(void) {};
   };
//+------------------------------------------------------------------+
//| DOMAIN CLASS                                                     |
//+------------------------------------------------------------------+
template <typename T>
class CDomain                       : public CObject
   {
      protected:
      
      int                           cardinal;
      CElement<T>                   elements[];
      
      public:
      
      bool                          Cardinality(int Value) { if(Value>=0 && Value<INT_MAX) { cardinal=Value; ArrayResize(elements,cardinal); return(true); } return(false); }
      int                           Cardinality() { return(cardinal); }
      
      bool                          Get(int ElementIdentity,CElement<T> &Element) { if(ElementIdentity>=0 && ElementIdentity<Cardinality()) { Element=elements[ElementIdentity]; return(true); } return(false); }
                                    
                                    //'IsIndexed' parameter specifies value should be unique in domain which is a typical requirement
                                    //there are exceptions however, such as when swapping values (see GetIsomorphisms()), where this rule could be suspended
      bool                          Set(int ValueIndex,CElement<T> &Value,bool IsIndexed=false) 
                                    { 
                                       if(ValueIndex>=0 && ValueIndex<Cardinality()) 
                                       { 
                                          if(!IsIndexed||Index(Value)<0)
                                          { 
                                             elements[ValueIndex]=Value; 
                                             return(true); 
                                          }
                                          else
                                          { 
                                             printf(__FUNCSIG__+" value already exists. "); 
                                          } 
                                       }
                                       else
                                       { 
                                          if(ValueIndex>=0 && Cardinality()<ValueIndex+1 && ValueIndex<INT_MAX)
                                          {
                                             if(Cardinality(ValueIndex+1))
                                             {
                                                elements[ValueIndex]=Value; 
                                                return(true); 
                                             }
                                          }
                                          else
                                          {
                                             printf(__FUNCSIG__+" index: "+IntegerToString(ValueIndex)+" out of bounds in domain cardinal: "+IntegerToString(Cardinality())); 
                                          }
                                       } 
                                       
                                       return(false); 
                                    }
      
      void                          Let()
                                    {
                                       this.Cardinality(0);
                                    };
                                    
      int                           Index(CElement<T> &Value)
                                    {
                                       int _index=-1;
                                       //
                                       for(int c=0; c<cardinal; c++)
                                       {
                                          if(ElementMatch(Value,elements[c]))
                                          {
                                             //printf(__FUNCSIG__+" value match at: "+IntegerToString(c)+" with value cardinality: "+IntegerToString(Value.Cardinality())+", & element cardinality: "+string(elements[c].Cardinality()));
                                             //
                                             //for(int cc=0; cc<elements[c].Cardinality(); cc++)
                                             {
                                                //printf(__FUNCSIG__+" value match at: "+IntegerToString(c)+" with value: "+string(Value.Get(cc))+", & element: "+string(elements[c].Get(cc)));
                                             }
                                             _index=c; break;
                                          }
                                       }
                                       
                                       return(_index);
                                    }
      
                                    CDomain(void)
                                    {
                                       Cardinality(0);
                                    };
                                    ~CDomain(void) {};
   };
//+------------------------------------------------------------------+
//| MORPHISM CLASS                                                   |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
class CMorphism
   {
      protected:
      
      int                           domain_index;
      int                           codomain_index;
      
      public:
      
      CDomain<TD>                   domain;
      CDomain<TC>                   codomain;
      
      int                           Domain(){ return(domain_index); };
      bool                          Domain(int DomainIndex) 
                                    { 
                                       if(DomainIndex>=0 && DomainIndex<domain.Cardinality()) 
                                       { 
                                          domain_index=DomainIndex; return(true); 
                                       }
                                       else
                                       { 
                                          if(DomainIndex>=0 && domain.Cardinality()==0 && DomainIndex<INT_MAX)
                                          { 
                                             domain.Cardinality(DomainIndex+1); domain_index=DomainIndex; return(true); 
                                          } 
                                          else if(DomainIndex!=-1)
                                          { 
                                             printf(__FUNCSIG__+" index: "+IntegerToString(DomainIndex)+" out of bounds for domain cardinal: "+IntegerToString(domain.Cardinality())+". "); 
                                          }
                                       } 
                                       
                                       return(false); 
                                    }
      
      int                           Codomain(){ return(codomain_index); };
      bool                          Codomain(int CodomainIndex) 
                                    { 
                                       if(CodomainIndex>=0 && CodomainIndex<codomain.Cardinality()) 
                                       { 
                                          codomain_index=CodomainIndex; return(true); 
                                       }
                                       else
                                       { 
                                          if(CodomainIndex>=0 && codomain.Cardinality()==0 && CodomainIndex<INT_MAX)
                                          { 
                                             codomain.Cardinality(CodomainIndex+1); codomain_index=CodomainIndex; return(true); 
                                          } 
                                          else if(CodomainIndex!=-1)
                                          { 
                                             printf(__FUNCSIG__+" index: "+IntegerToString(CodomainIndex)+" out of bounds for codomain cardinal: "+IntegerToString(codomain.Cardinality())+". "); 
                                          } 
                                       } 
                                       
                                       return(false); 
                                    }
      
                                    template <typename TDD,typename TDC>
      bool                          Morph(CDomain<TDD> &D,CDomain<TDC> &C,int DomainIndex,int CodomainIndex)
                                    {
                                       if(DomainIndex>=0 && DomainIndex<D.Cardinality() && CodomainIndex>=0 && CodomainIndex<D.Cardinality())
                                       {
                                          domain_index=DomainIndex;
                                          codomain_index=CodomainIndex;
                                          
                                          domain=D;
                                          codomain=C;
                                          
                                          return(true);
                                       }
                                       
                                       return(false);
                                    }
      
      void                          Let()
                                    {
                                       this.codomain.Cardinality(0);
                                       this.domain.Cardinality(0);
                                       this.Codomain(-1);
                                       this.Domain(-1);
                                    };
      
                                    CMorphism(void){ domain_index=-1; codomain_index=-1; };
                                    ~CMorphism(void){};
   };
//+------------------------------------------------------------------+
//| HOMO-MORPHISM CLASS                                              |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
class CHomomorphism                 : public CObject
   {
      protected:
      
      int                           morphisms;
      
      public:
      
      CDomain<TD>                   domain;
      CDomain<TC>                   codomain;
      
      CMorphism<TD,TC>              morphism[];
      
      int                           Morphisms() { return(morphisms); }
      bool                          Morphisms(int Value) { if(Value>=0 && Value<INT_MAX) { morphisms=Value; ArrayResize(morphism,morphisms); return(true); } return(false); }
      
      bool                          Get(int MorphismIndex,CMorphism<TD,TC> &Morphism) { if(MorphismIndex>=0 && MorphismIndex<Morphisms()) { Morphism=morphism[MorphismIndex]; Morphism.domain=domain; Morphism.codomain=codomain; Morphism.Domain(morphism[MorphismIndex].Domain()); Morphism.Codomain(morphism[MorphismIndex].Codomain()); return(true); } return(false); }
      
                                    template <typename TDD,typename TDC>
      bool                          Set(int ValueIndex,CMorphism<TDD,TDC> &Value)
                                    {
                                       if
                                       (
                                       (string(typename(TD))!=string(typename(TDD)))
                                       ||
                                       (string(typename(TC))!=string(typename(TDC)))
                                       )
                                       {
                                          return(false);
                                       }
                                       //
                                       /*if(!DomainMatch(Value.domain,domain)||!DomainMatch(Value.codomain,codomain))
                                       {
                                          printf(__FUNCSIG__+" mismatched domain and/or codomain... ");
                                          return(false);
                                       }*/
                                       // 
                                       int _index=Index(Value);//printf(__FUNCSIG__+" Index: "+IntegerToString(_index));
                                       //
                                       if(_index==-1)
                                       {
                                          if(ValueIndex>=0 && ValueIndex<Morphisms())
                                          {
                                             morphism[ValueIndex]=Value;//printf(__FUNCSIG__+" re-assigned... ");
                                             
                                             return(true);
                                          }
                                          else if(ValueIndex>=0 && ValueIndex<INT_MAX)
                                          {
                                             if(Morphisms(ValueIndex+1))
                                             {
                                                morphism[ValueIndex]=Value;//printf(__FUNCSIG__+" incremented... ");
                                                
                                                return(true);
                                             }
                                          }
                                       }
                                       
                                       return(false); 
                                    };
      
      void                          Let()
                                    {
                                       this.Morphisms(0);
                                       this.domain.Cardinality(0);
                                       this.codomain.Cardinality(0);
                                    };
      
      int                           Index(CMorphism<TD,TC> &Value)
                                    {
                                       int _index=-1;
                                       //
                                       for(int m=0; m<Morphisms(); m++)
                                       {
                                          if(MorphismMatch(Value,morphism[m]))
                                          {
                                             _index=m; break;
                                          }
                                       }
                                       
                                       return(_index);
                                    }
      
                                    CHomomorphism(void){  Morphisms(0); };
                                    ~CHomomorphism(void){};
   };
//+------------------------------------------------------------------+
//| ONTOLOGY ENUM                                                    |
//+------------------------------------------------------------------+
enum EOntology
  {
      ONTOLOGY_PRE=-1,
      ONTOLOGY_NEW=0,
      ONTOLOGY_POST=1
  };
//+------------------------------------------------------------------+
//| ONTOLOGY STRUCT                                                  |
//+------------------------------------------------------------------+
struct SOntology
  {
      int                           in;
      int                           out;
      
                                    SOntology()
                                    {
                                       in=-1;
                                       out=-1;
                                    };
                                    ~SOntology(){};
  };
//+------------------------------------------------------------------+
//| ONTOLOGY CLASS                                                   |
//+------------------------------------------------------------------+
class COntology
  {
      protected:
      
      int                           facts;
      
      SOntology                     types[];
      SOntology                     universe[];
      
      public:
      
      string                        ontology;
      
      int                           Facts() { return(facts); }
      bool                          Facts(int Value) { if(Value>=0 && Value<INT_MAX) { facts=Value; ArrayResize(types,facts); ArrayResize(universe,facts); return(true); } return(false); }
      
      bool                          GetType(int TypeIndex,int &TypeIn,int &TypeOut) { if(TypeIndex>=0 && TypeIndex<Facts()) { TypeIn=types[TypeIndex].in; TypeOut=types[TypeIndex].out; return(true); } return(false); }
      bool                          SetType(int ValueIndex,int ValueIn,int ValueOut) 
                                    { 
                                       if(ValueIndex>=0 && ValueIndex<Facts()) 
                                       { 
                                          types[ValueIndex].in=ValueIn; types[ValueIndex].out=ValueOut; 
                                          return(true); 
                                       } 
                                       else if(ValueIndex>=0 && ValueIndex>=Facts() && ValueIndex<INT_MAX-1) 
                                       { 
                                          if(Facts(ValueIndex+1))
                                          {
                                             types[ValueIndex].in=ValueIn; types[ValueIndex].out=ValueOut; 
                                             return(true); 
                                          }
                                       } 
                                       
                                       return(false); 
                                    }
      
      bool                          GetUniverse(int UniverseIndex,int &UniverseIn,int &UniverseOut) { if(UniverseIndex>=0 && UniverseIndex<Facts()) { UniverseIn=universe[UniverseIndex].in; UniverseOut=universe[UniverseIndex].out; return(true); } return(false); }
      bool                          SetUniverse(int ValueIndex,int ValueIn,int ValueOut) 
                                    { 
                                       if(ValueIndex>=0 && ValueIndex<Facts()) 
                                       { 
                                          universe[ValueIndex].in=ValueIn; universe[ValueIndex].out=ValueOut; 
                                          return(true); 
                                       } 
                                       else if(ValueIndex>=0 && ValueIndex>=Facts() && ValueIndex<INT_MAX-1) 
                                       { 
                                          if(Facts(ValueIndex+1))
                                          {
                                             universe[ValueIndex].in=ValueIn; universe[ValueIndex].out=ValueOut; 
                                             return(true); 
                                          }
                                       } 
                                       
                                       return(false); 
                                    }
      
      string                        old_hash;
      string                        new_hash;
      
                                    COntology()
                                    {
                                       ontology="";
                                       
                                       facts=0;
                                       
                                       ArrayResize(types,facts);
                                       ArrayResize(universe,facts);
                                       
                                       old_hash="";
                                       new_hash="";
                                    };
                                    ~COntology(){};
  };
//+------------------------------------------------------------------+
//| CATEGORY CLASS                                                   |
//+------------------------------------------------------------------+
class CCategory
   {
      protected:
      
      int                           domains_datetime;
      int                           domains_string;
      int                           domains_double;
      int                           domains_int;
      
      int                           ontologies;
      
      CDomain<datetime>             domain_datetime[];
      CDomain<string>               domain_string[];
      CDomain<double>               domain_double[];
      CDomain<int>                  domain_int[];
      
      COntology                     ontology[];
      
      public:
      
      int                           Domain(string T)
                                    { 
                                       if(T=="datetime"){ return(domains_datetime); }
                                       else if(T=="string"){ return(domains_string); }
                                       else if(T=="double"){ return(domains_double); }
                                       
                                       return(domains_int);
                                    };
      
      bool                          Domain(string T,int Value)
                                    { 
                                       if(Value>=0 && Value<INT_MAX)
                                       { 
                                          if(T=="datetime")
                                          { 
                                             if(ArrayResize(domain_datetime,Value)>=Value)
                                             {
                                                domains_datetime=Value;  
                                                return(true); 
                                             } 
                                          }
                                          else if(T=="string")
                                          { 
                                             if(ArrayResize(domain_string,Value)>=Value)
                                             {
                                                domains_string=Value;  
                                                return(true); 
                                             } 
                                          }
                                          else if(T=="double")
                                          { 
                                             if(ArrayResize(domain_double,Value)>=Value)
                                             {
                                                domains_double=Value;  
                                                return(true); 
                                             } 
                                          }
                                          else //if(T=="int")
                                          { 
                                             if(ArrayResize(domain_int,Value)>=Value)
                                             {
                                                domains_int=Value;  
                                                return(true);
                                             }  
                                          }
                                       } 
                                       
                                       return(false); 
                                    };
                                    
                                    
      int                           Ontology(){ return(ontologies); };
      bool                          Ontology(int Value){ if(Value>=0 && Value<INT_MAX){ ontologies=Value; ArrayResize(ontology,ontologies); return(true); } return(false); };
      
      
                                    template <typename T>
      bool                          Set(int ValueIndex,CDomain<T> &Value)
                                    {
                                       if(Index(Value)==-1 && ValueIndex>=0)
                                       {
                                          if
                                          (
                                          ValueIndex<Domain(string(typename(T)))
                                          ||
                                          (ValueIndex>=Domain(string(typename(T))) && Domain(string(typename(T)),ValueIndex+1))
                                          )
                                          {
                                             if(string(typename(T))=="datetime")
                                             {
                                                domain_datetime[ValueIndex]=Value;
                                                return(true);
                                             }
                                             else if(string(typename(T))=="string")
                                             {
                                                domain_string[ValueIndex]=Value;
                                                
                                                return(true);
                                             }
                                             else if(string(typename(T))=="double")
                                             {
                                                domain_double[ValueIndex]=Value;
                                                return(true);
                                             }
                                             else //if(string(typename(T))=="int")
                                             {
                                                domain_int[ValueIndex]=Value;
                                                return(true);
                                             }
                                          }
                                       }
                                       //
                                       return(false);
                                    };
                                    
                                    template <typename T>
      bool                          Get(int DomainIndex,CDomain<T> &D)
                                    {
                                       if(DomainIndex>=0 && DomainIndex<Domain(string(typename(T))))
                                       {
                                          if(string(typename(T))=="datetime")
                                          {
                                             D=domain_datetime[DomainIndex];
                                             
                                             return(true);
                                          }
                                          else if(string(typename(T))=="string")
                                          {
                                             D=domain_string[DomainIndex];
                                             
                                             return(true);
                                          }
                                          else if(string(typename(T))=="double")
                                          {
                                             D=domain_double[DomainIndex];
                                             
                                             return(true);
                                          }
                                          else //if(string(typename(T))=="int")
                                          {
                                             D=domain_int[DomainIndex];
                                             
                                             return(true);
                                          }
                                       }
                                       
                                       return(false);
                                    };
                                    
      bool                          Set(int ValueIndex,COntology &Value)
                                    {
                                       if
                                       (
                                       ValueIndex>=0 && ValueIndex<Ontology()
                                       )
                                       {
                                          ontology[ValueIndex]=Value;
                                          return(true);
                                       }
                                       else if(ValueIndex>=Ontology())
                                       {
                                          if(Ontology(Ontology()+1))
                                          {
                                             ontology[Ontology()-1]=Value;
                                             return(true);
                                          }
                                       }
                                       //
                                       return(false);
                                    };
                                    
      bool                          Get(int OntologyIndex,COntology &O)
                                    {
                                       if(OntologyIndex>=0 && OntologyIndex<Ontology())
                                       {
                                          O=ontology[OntologyIndex];
                                          
                                          return(true);
                                       }
                                       
                                       return(false);
                                    };
      
      
                                    template <typename T>
      int                           Index(CDomain<T> &Value)
                                    {
                                       int _index=-1;
                                       //
                                       for(int d=0; d<Domain(string(typename(T))); d++)
                                       {
                                          if(string(typename(T))=="string")
                                          {
                                             if(DomainMatch(Value,domain_string[d]))
                                             {
                                                _index=d; break;
                                             }
                                          }
                                          else if(string(typename(T))=="datetime")
                                          {
                                             if(DomainMatch(Value,domain_int[d]))
                                             {
                                                _index=d; break;
                                             }
                                          }
                                          else if(string(typename(T))=="double")
                                          {
                                             if(DomainMatch(Value,domain_double[d]))
                                             {
                                                _index=d; break;
                                             }
                                          }
                                          else if(string(typename(T))=="int")
                                          {
                                             if(DomainMatch(Value,domain_int[d]))
                                             {
                                                _index=d; break;
                                             }
                                          }
                                       }
                                       
                                       return(_index);
                                    }
      
      
      int                           Index(COntology &Value)
                                    {
                                       int _index=-1;
                                       //
                                       for(int o=0; o<Ontology(); o++)
                                       {
                                          if(!OntologyMatch(Value,ontology[o]))
                                          {
                                             _index=o; break;
                                          }
                                       }
                                       
                                       return(_index);
                                    }
      
                                    CCategory()
                                    { 
                                       domains_datetime=0; 
                                       domains_string=0; 
                                       domains_double=0; 
                                       domains_int=0; 
                                       
                                       ontologies=0; 
                                    };
                                    ~CCategory()
                                    { 
                                    };
   };
//+------------------------------------------------------------------+
//| Square Commute Class to illustrate Multi-Domains                 |
//+------------------------------------------------------------------+
template <typename TA,typename TB,typename TC,typename TD>
class CCommuteSquare
   {
      public:
      
      CHomomorphism<TA,TB>          ab;
      CHomomorphism<TA,TC>          ac;
      CHomomorphism<TB,TD>          bd;
      CHomomorphism<TC,TD>          cd;
      
      virtual void                  SquareAssert()
                                    {
                                       ab.domain=ac.domain;
                                       ab.codomain=bd.domain;
                                       cd.domain=ac.codomain;
                                       cd.codomain=bd.codomain;
                                    }
      
                                    CCommuteSquare(){};
                                    ~CCommuteSquare(){};
   };
//+------------------------------------------------------------------+
//| Triangle Commute Class to illustrate Relative-Domains            |
//+------------------------------------------------------------------+
template <typename TA,typename TB,typename TC>
class CCommuteTriangle
   {
      public:
      
      CHomomorphism<TA,TB>          ab;
      CHomomorphism<TA,TC>          ac;
      CHomomorphism<TB,TC>          bc;
      
      virtual void                  TriangleAssert()
                                    {
                                       ab.domain=ac.domain;
                                       ab.codomain=bc.domain;
                                       ac.codomain=bc.codomain;
                                    };
      
                                    CCommuteTriangle()
                                    {
                                    };
                                    ~CCommuteTriangle(){};
   };
//+------------------------------------------------------------------+
//| Weights for linear-relations in Morphisms                        |
//+------------------------------------------------------------------+
struct SLinearWeights
  {
      double                        m;
      int                           c;
      
                                    SLinearWeights()
                                    {
                                       m=0.0;c=0;
                                    };
                                    ~SLinearWeights(){};
  };
//+------------------------------------------------------------------+
//| Enumeration for Monoid Operations                                |
//+------------------------------------------------------------------+
enum EOperations
  {
      OP_FURTHEST=5,
      OP_CLOSEST=4,
      OP_MOST=3,
      OP_LEAST=2,
      OP_MULTIPLY=1,
      OP_ADD=0
  };
//+------------------------------------------------------------------+
//| Monoid Class                                                     |
//+------------------------------------------------------------------+
template <typename T>
class CMonoid                       : public CDomain<T>
   {
      protected:
      
      int                           identity;
      EOperations                   operation;
      
      public:
      
      void                          Operation(EOperations Value) {  operation=Value; }
      EOperations                   Operation() { return(operation); }
      
      bool                          Identity(int ElementIdentity) { if(ElementIdentity>=0 && ElementIdentity<Cardinality()) { identity=ElementIdentity; return(true); } return(false); }
      int                           Identity() { return(identity); }
      
                                    CMonoid(){ identity=0; operation=OP_ADD; };
                                    ~CMonoid(){};
   };
//+------------------------------------------------------------------+
//| Fill Domain(Set) with one-cardinal elements from input E array.  |
//+------------------------------------------------------------------+
template <typename TD,typename TE>
void FillDomain(CDomain<TD> &D,CElement<TE> &E[])
   {
      if(string(typename(TD))!=string(typename(TE)))
      {
         return;
      }
      
      int _cardinal=ArraySize(E);
      //
      if(_cardinal<0||INT_MAX<=_cardinal)
      {
         return;
      }
      
      //Set its cardinal to input array size
      if(D.Cardinality(_cardinal))
      {
         for(int c=0;c<_cardinal;c++)
         {
            D.Set(c,E[c],true);
         }
      }
   }
//+------------------------------------------------------------------+
//| Fill Domain with handle data.                                    |
//+------------------------------------------------------------------+
template <typename T>
bool FillDomain(CDomain<T> &D,int Index,int Size,int &Handle,int Buffer=0)
   {
      double _buffer[];ArrayResize(_buffer,Size);ArrayInitialize(_buffer,0.0);
      
      if(CopyBuffer(Handle,Buffer,0,Size,_buffer)>=Size)
      {
         for(int p=0;p<Size;p++)
         {
            CElement<double> _e;
            if(_e.Cardinality(1))
            {
               if(_e.Set(0,_buffer[p]))
               { 
                  D.Set(p,_e); 
               }
            }
         }
      }
      
      return(true);
   }
//+------------------------------------------------------------------+
//| Element Match function                                           |
//+------------------------------------------------------------------+
template <typename TA,typename TB>
bool ElementMatch(CElement<TA> &A,CElement<TB> &B)
   {
      if(string(typename(TA))!=string(typename(TB)))
      {
         return(false);
      }
      
      if(A.Cardinality()!=B.Cardinality())
      {
         return(false);
      }
      
      if(A.Cardinality()==0||B.Cardinality()==0)
      {
         return(false);
      }
      
      bool _matched=true;
      
      for(int r=0; r<A.Cardinality(); r++)
      {
         TA _a;TB _b;
         if(A.Get(r,_a) && B.Get(r,_b) && _a!=_b)
         {
            _matched=false;
            break;
         }
      }
      
      return(_matched);
   }
//+------------------------------------------------------------------+
//| Domain Match function                                            |
//+------------------------------------------------------------------+
template <typename TA,typename TB>
bool DomainMatch(CDomain<TA> &A,CDomain<TB> &B)
   {
      if(string(typename(TA))!=string(typename(TB)))
      {
         //printf(__FUNCSIG__+" type mismatch. ");
         return(false);
      }
      
      if(A.Cardinality()!=B.Cardinality())
      {
         //printf(__FUNCSIG__+" cardinality mismatch. ");
         return(false);
      }
      
      /*if(A.Cardinality()==0||B.Cardinality()==0)
      {
         return(false);
      }*/
      
      bool _matched=true;
      
      for(int o=0; o<A.Cardinality(); o++)
      {
         CElement<TA> _a;
         CElement<TB> _b;
         
         if(A.Get(o,_a) && B.Get(o,_b) && !ElementMatch(_a,_b))
         {
            //printf(__FUNCSIG__+" element mismatch at: "+IntegerToString(o));
            _matched=false; break;
         }
      }
      
      return(_matched);
   }
//+------------------------------------------------------------------+
//| Morphism Match function                                          |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
bool MorphismMatch(CMorphism<TD,TC> &A,CMorphism<TD,TC> &B)
   {
      bool _matched=true;
      
      if(A.Domain()!=B.Domain()||A.Codomain()!=B.Codomain())
      {
         _matched=false;return(_matched);
      }
      
      if(!DomainMatch(A.domain,B.domain)||!DomainMatch(A.codomain,B.codomain))
      {
         _matched=false;return(_matched);
      }
      
      return(_matched);
   }
//+------------------------------------------------------------------+
//| Homomorphism Match function                                      |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
bool HomomorphismMatch(CHomomorphism<TD,TC> &A,CHomomorphism<TD,TC> &B)
   {
      if(A.Morphisms()!=B.Morphisms())
      {
         return(false);
      }
      
      bool _matched=true;
      
      for(int m=0; m<A.Morphisms(); m++)
      {
         CMorphism<TD> _a;
         CMorphism<TC> _b;
         
         if(A.Get(o,_a) && B.Get(o,_b) && !MorphismMatch(_a,_b))
         {
            _matched=false; break;
         }
      }
      
      return(_matched);
   }
//+------------------------------------------------------------------+
//| Ontology Match function                                          |
//+------------------------------------------------------------------+
bool OntologyMatch(COntology &A,COntology &B)
   {
      if(A.Facts()!=B.Facts())
      {
         return(false);
      }
      
      if(A.ontology!=B.ontology)
      {
         return(false);
      }
      
      bool _matched=true;
      
      for(int o=0; o<A.Facts(); o++)
      {
         int _a_t_in=-1,_a_t_out=-1,_a_u_in=-1,_a_u_out=-1;
         int _b_t_in=-1,_b_t_out=-1,_b_u_in=-1,_b_u_out=-1;
         
         if(A.GetType(o,_a_t_in,_a_t_out) && B.GetType(o,_b_t_in,_b_t_out) && A.GetUniverse(o,_a_u_in,_a_u_out) && B.GetUniverse(o,_b_u_in,_b_u_out))
         {
            if(_a_t_in!=_b_t_in||_a_t_out!=_b_t_out||_a_u_in!=_b_u_in||_a_u_out!=_b_u_out)
            {
               _matched=false; break;
            }
         }
      }
      
      return(_matched);
   }
//+------------------------------------------------------------------+
//| Print Element function                                           |
//+------------------------------------------------------------------+
template <typename T>
string PrintElement(CElement<T> &E,int FloatPrecision=1)
   {
      string _element="(";
      //
      for(int r=0; r<E.Cardinality(); r++)
      {
         if(string(typename(T))=="datetime")
         {
            T _date;
            if(E.Get(r,_date)){ _element+=TimeToString(datetime(_date)); }
         }
         else if(string(typename(T))=="string")
         {
            T _string;
            if(E.Get(r,_string)){ _element+=string(_string); }
         }
         else if(string(typename(T))=="double"||string(typename(T))=="float")
         {
            T _double;
            if(E.Get(r,_double)){ _element+=DoubleToString(double(_double)); }
         }
         else //if(string(typename(T))=="int")
         {
            T _int;
            if(E.Get(r,_int)){ _element+=IntegerToString(int(_int)); }
         }
         
         if(r<E.Cardinality()-1){ _element+=","; }
      }
      //
      return(_element+")");
   }
//+------------------------------------------------------------------+
//| Print Morphism function                                          |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
string PrintMorphism(CMorphism<TD,TC> &M,int FloatPrecision=1)
   {
      string _morphism="";
      //
      CElement<TD> _d;
      CElement<TC> _c;
      ResetLastError();
      if(M.domain.Get(M.Domain(),_d) && M.codomain.Get(M.Codomain(),_c))
      {
         _morphism=PrintElement(_d,FloatPrecision);
         _morphism+="|----->";
         _morphism+=PrintElement(_c,FloatPrecision);
         _morphism+="\n";
      }
      else
      {
         //printf(__FUNCSIG__+" could not get element from: "+OBJECT_NAME(M.Domain)+", at domain index: "+IntegerToString(M.Domain())+" and/or "+OBJECT_NAME(M.Codomain)+", at codomain index: "+IntegerToString(M.Codomain())+", err: "+IntegerToString(GetLastError()));
      }
      //
      return(_morphism);
   }
//+------------------------------------------------------------------+
//| Print Domain function                                            |
//+------------------------------------------------------------------+
template <typename T>
string PrintDomain(CDomain<T> &D,int FloatPrecision=1)
   {
      string _domain="{";
      //
      CElement<T> _e;
      for(int o=0; o<D.Cardinality(); o++)
      {
         D.Get(o,_e);
         _domain+=PrintElement(_e,FloatPrecision);if(o<D.Cardinality()-1){ _domain+=","; }
      }
      //
      return(_domain+"}\n");
   }
//+------------------------------------------------------------------+
//| Print Homomorphism function                                      |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
string PrintHomomorphism(CHomomorphism<TD,TC> &H,int FloatPrecision=1)
   {
      string _homomorphism="\n\n"+PrintDomain(H.domain,FloatPrecision);
      //
      _homomorphism+="|\n";
      
      CMorphism<TD,TC> _m;
      for(int m=0;m<H.Morphisms();m++)
      {
         if(H.Get(m,_m))
         {
            _homomorphism+=(PrintMorphism(_m,FloatPrecision));
         }
      }
      //
      _homomorphism+="|\n";
      
      _homomorphism+=PrintDomain(H.codomain,FloatPrecision);
      //
      return(_homomorphism);
   }
//+------------------------------------------------------------------+
//| Get Subdomains function                                          |
//+------------------------------------------------------------------+
template <typename T>
void GetSubdomains(CDomain<T> &D,int &SubdomainCount,CDomain<T> &Subdomains[])
   {
      for(int o=1; o<=D.Cardinality(); o++)
      {
         GetSubdomains(D,0,0,o,SubdomainCount,Subdomains);
      }
   }
//+------------------------------------------------------------------+
//| Get Subdomains function                                          |
//+------------------------------------------------------------------+
template <typename T>
void GetSubdomains(CDomain<T> &D,int Start,int Index,int Number,int &SubdomainCount,CDomain<T> &Subdomains[])
   {
      // Get domain cardinal
      int _n = D.Cardinality();
      
      int _i,_j;
      
      if(Index-Start+1==Number)
      {
         if(Number==1)
         {
            CElement<T> _e;
            
            if(_e.Cardinality(0))
            {
               for(_i=0; _i<_n; _i++)
               {
                  SubdomainCount++;
                  ArrayResize(Subdomains,SubdomainCount);
                  
                  if(ArraySize(Subdomains)==SubdomainCount && Subdomains[SubdomainCount-1].Cardinality(0) && D.Get(_i,_e) && Subdomains[SubdomainCount-1].Cardinality(1))
                  {
                     Subdomains[SubdomainCount-1].Set(0,_e,true);
                  }
               }
            }
         }
         else
         {
            for(_j=Index; _j<_n; _j++)
            {
               SubdomainCount++;
               ArrayResize(Subdomains,SubdomainCount);
               
               CElement<T> _e;
               
               if(_e.Cardinality(0) && ArraySize(Subdomains)==SubdomainCount && Subdomains[SubdomainCount-1].Cardinality(0))
               {
                  for(_i=Start; _i<Index; _i++)
                  {
                     if(D.Get(_i,_e) && Subdomains[SubdomainCount-1].Cardinality(Subdomains[SubdomainCount-1].Cardinality()+1))
                     {
                        Subdomains[SubdomainCount-1].Set(Subdomains[SubdomainCount-1].Cardinality()-1,_e,true);
                     }
                  }
                  
                  if(D.Get(_j,_e) && Subdomains[SubdomainCount-1].Cardinality(Subdomains[SubdomainCount-1].Cardinality()+1))
                  {
                     Subdomains[SubdomainCount-1].Set(Subdomains[SubdomainCount-1].Cardinality()-1,_e,true);
                  }
               }
            }
            
            if(Start!=_n-Number)
            {
               GetSubdomains(D,Start+1,Start+1,Number,SubdomainCount,Subdomains);
            }
         }
      }
      else
      {
         GetSubdomains(D,Start,Index+1,Number,SubdomainCount,Subdomains);
      }
   }
//+------------------------------------------------------------------+
//| Is Subdomain function                                            |
//+------------------------------------------------------------------+
template <typename T>
bool IsSubdomain(CDomain<T> &Domain,CDomain<T> &SubDomain)
   {
      bool _is_subdomain=false;
      
      int _subdomain_count=0; CDomain<T> _subdomains[];
      GetSubdomains(Domain,_subdomain_count,_subdomains);
      
      for(int c=0;c<_subdomain_count;c++)
      {
         if(DomainMatch(SubDomain,_subdomains[c]))
         {
            _is_subdomain=true;
            break;
         }
      }
      
      return(_is_subdomain);
   }
//+------------------------------------------------------------------+
//| Image function                                                   |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
void Image(CHomomorphism<TD,TC> &H,CDomain<TC> &Output)
   {
      for(int m=0;m<H.Morphisms();m++)
      {
         CElement<TC> _e;
         CMorphism<TD,TC> _m;
         if(H.Get(m,_m) && H.codomain.Get(_m.Codomain(),_e))
         {
            bool _matched=false;
            for(int o=0;o<Output.Cardinality();o++)
            {
               CElement<TC> _ee;
               if(Output.Get(o,_ee) && ElementMatch(_e,_ee))
               {
                  _matched=true; break;
               }
            }
            
            if(!_matched)
            {
               Output.Cardinality(Output.Cardinality()+1);
               Output.Set(Output.Cardinality()-1,_e,true);
            }
         }
      }
   }
//+------------------------------------------------------------------+
//| Get Isomorphisms function                                        |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
bool IsIsomorphic(CDomain<TD> &A,CDomain<TC> &B,CHomomorphism<TD,TC> &Output[])
   {
      if(A.Cardinality()!=B.Cardinality())
      {
         return(false);
      }
      
      int _cardinal=A.Cardinality();
      
      uint _factorial=MathFactorial(_cardinal);
      
      ArrayResize(Output,_factorial);
      
      for(uint f=0;f<_factorial;f++)
      {
         ArrayResize(Output[f].morphism,_cardinal);
         //
         for(int c=0;c<_cardinal;c++)
         {
            Output[f].morphism[c].domain=A;
            Output[f].morphism[c].codomain=B;
         }
      }
      
      int _index=0;
      CDomain<TC> _output[];ArrayResize(_output,_factorial);
      GetIsomorphisms(B, 0, _cardinal-1, _cardinal, _index, _output);
      
      for(uint f=0;f<_factorial;f++)
      {
         for(int c=0;c<_cardinal;c++)
         {
            CElement<TC> _ec;
            if(_output[f].Get(c,_ec))
            {
               for(int cc=0;cc<_cardinal;cc++)
               {
                  CElement<TC> _ecc;
                  if(B.Get(cc,_ecc))
                  {
                     if(ElementMatch(_ec,_ecc))
                     {
                        if(Output[f].morphism[c].Codomain(cc))
                        {
                           break;
                        }
                     }
                  }
               }
            }
            
            if(Output[f].morphism[c].Domain(c))
            {
            }
         }
      }
         
      return(true);
   }
//+------------------------------------------------------------------+
//| Get Isomorphisms function                                        |
//+------------------------------------------------------------------+
template <typename T>
void GetIsomorphisms(CDomain<T> &B,int Start,int Stop,int Cardinality,int &Index,CDomain<T> &Output[]) 
   {
      if(Start == Stop) 
      {
         Output[Index].Cardinality(0);
         Output[Index].Cardinality(B.Cardinality());
         // the permutation
         for (int i = 0; i <= Stop; i++) 
         {
            CElement<T> _e;
            if(B.Get(i,_e))
            {
               Output[Index].Set(i,_e,true);
            }
         }
         
         Index++;
      } 
      else 
      {
         CElement<T> _e;
         if(B.Get(Start,_e))
         {
            for (int i = Start; i <= Stop; i++) 
            {
               // swap the elements at indices start and i
               CElement<T> _ei;
               if(B.Get(i,_ei))
               {
                  CElement<T> _temp = _e;
                  if(B.Set(Start,_ei))
                  {
                     if(B.Set(i,_e))
                     {
                        // recursively permute the remaining elements
                        GetIsomorphisms(B, Start + 1, Stop, Cardinality, Index, Output);
                     
                        // swap the elements back to their original positions
                        if(B.Set(Start,_e))
                        {
                           B.Set(i,_ei);
                        }
                     }
                  }
               }
            }
         }
      }
   }
//+------------------------------------------------------------------+
//| Factorial function                                               |
//+------------------------------------------------------------------+
uint MathFactorial(uint N)
   {
      uint _factorial=N,_n=N-1;
      
      while(_n>0)
      {
         _factorial*=_n;
         
         _n--;
         
         if(_n<=0){ break; }
      }
      
      return(_factorial);
   }
//+------------------------------------------------------------------+
//| Set Ontology function                                            |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
bool SetCategory(CCategory &C,int DomainIndex,int CodomainIndex,int TypeIndex,int CotypeIndex,COntology &Log,string Aspect,CMorphism<TD,TC> &Output,EOntology LogType=ONTOLOGY_NEW)
   {
      if(Log.Facts(Log.Facts()+1))
      {
         int _fact=Log.Facts()-1;
         
         if(Log.SetType(_fact,TypeIndex,CotypeIndex) && Log.SetUniverse(_fact,DomainIndex,CodomainIndex))
         {
            CDomain<TD> _dd;
            CDomain<TC> _dc;
            CElement<TD> _ed;
            CElement<TC> _ec;
            
            if(C.Get(DomainIndex,_dd) && C.Get(CodomainIndex,_dc))
            {
               if(_dd.Get(TypeIndex,_ed) && _dc.Get(CotypeIndex,_ec))
               {
                  string _eds="",_ecs="";
                  for(int c=0;c<_ed.Cardinality();c++){ _eds+=string(_ed.Get(c)); }
                  for(int c=0;c<_ec.Cardinality();c++){ _ecs+=string(_ec.Get(c)); }
                  
                  if(LogType==ONTOLOGY_NEW)
                  {
                     Log.ontology=_eds+Aspect+_ecs;
                  }
                  else if(LogType==ONTOLOGY_POST)
                  {
                     Log.ontology=Log.ontology+Aspect+_ecs;
                  }
                  else if(LogType==ONTOLOGY_PRE)
                  {
                     Log.ontology=_eds+Aspect+Log.ontology;
                  }
                  
                  Log.old_hash=Log.new_hash;
                  int _u_in=-1,_t_in=-1,_u_out=-1,_t_out=-1;
                  //
                  if(Log.GetUniverse(DomainIndex,_u_in,_u_out) && Log.GetType(TypeIndex,_t_in,_t_out))
                  {
                     string _encoding=IntegerToString(_u_in)+"-"+IntegerToString(_t_in)+"-"+IntegerToString(_u_out)+"-"+IntegerToString(_t_out);
                     
                     uchar _encoded_string[];
                     string _encoded=EncodeString(_encoding,_encoded_string);
                     
                     Log.new_hash=EncodeHEX(_encoded_string);
                  }
                  
                  if(Output.Morph(_dd,_dc,_ed,_ec))
                  {
                     return(true);
                  }
               }
            }
         }
      }
      
      return(false);
   }
//+------------------------------------------------------------------+
//| Encode string to HEX function                                    |
//+------------------------------------------------------------------+
string EncodeHEX(uchar &EncodedString[],int Count=-1)
   {
      string _hex="";
      
      if(Count<0 || Count>ArraySize(EncodedString)){ Count=ArraySize(EncodedString); }
      
      for(int c=0;c<Count;c++)
      {
         _hex+=StringFormat("%.2X",EncodedString[c]);
      }
      
      return(_hex);
   }
//+------------------------------------------------------------------+
//| Encode HEX to hash function                                      |
//+------------------------------------------------------------------+
string EncodeString(string RawString,uchar &EncodedString[])
   {
      uchar _source[],_key[],_hashkey[];
      ArrayResize(_key,8);
      for(int k=0;k<8;k++){ _key[k]=uchar((k*5)%13); }
      
      StringToCharArray(TimeToString(TimeCurrent()),_source,0,fmin(StringLen(TimeToString(TimeCurrent())),StringLen(RawString)));
      
      ResetLastError();
      if(CryptEncode(CRYPT_HASH_SHA1,_source,_key,_hashkey)<1)
      {
         printf(__FUNCSIG__+" encode err: "+IntegerToString(GetLastError()));
      }
      
      StringToCharArray(RawString,_source,0,StringLen(RawString));
      
      ResetLastError();
      if(CryptEncode(CRYPT_HASH_SHA1,_source,_hashkey,EncodedString)<1)
      {
         printf(__FUNCSIG__+" encode err: "+IntegerToString(GetLastError()));
      }
      
      return(CharArrayToString(EncodedString));
   }
//+------------------------------------------------------------------+
//| Get Coproduct function                                           |
//+------------------------------------------------------------------+
template <typename T>
bool DomainToString(CDomain<T> &D,CDomain<string> &Output)
   {
      if(D.Cardinality()<=0){ return(false); }
      
      bool _set=true;
      //
      if(Output.Cardinality(D.Cardinality()))
      {
         for(int d=0;d<D.Cardinality();d++)
         {
            CElement<T> _e_get;
            CElement<string> _e_set;
            if(D.Get(d,_e_get))
            {
               if(_e_set.Cardinality(_e_get.Cardinality()))
               {
                  for(int e=0;e<_e_get.Cardinality();e++)
                  {
                     if(!_e_set.Set(e,string(_e_get.Get(e))))
                     {
                        _set=false;break;
                     }
                  }
                  //
                  if(_set)
                  {
                     Output.Set(d,_e_set,true);
                  }
                  else{ break; }
               }
            }
         }
      }
      
      return(_set);
   }
//+------------------------------------------------------------------+
//| Get Equalizer function (not tested)                              |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
int GetEqualizer(CHomomorphism<TD,TC> &H)
   {
      int _equal=-1;
      
      for(int d=1;d<=_Digits;d++)
      {
         CElement<double> _e;
         if(H.codomain.Get(0,_e))
         {
            double _base=_e.Get(0);
            
            for(int c=1;c<H.codomain.Cardinality();c++)
            {
               CElement<double> _e_1;
               if(H.codomain.Get(c,_e_1))
               {
                  if(NormalizeDouble(_e_1.Get(0),d)!=_base)
                  {
                     break;
                  }
                  else if(c==H.codomain.Cardinality()-1)
                  {
                     _equal=d; break;
                  }
               }
            }
            
            if(_equal!=-1){ break; }
         }
         
         if(_equal!=-1){ break; }
      }
      
      return(_equal);
   }
//+------------------------------------------------------------------+
//| Get Multiplicity.                                                |
//+------------------------------------------------------------------+
template <typename TD,typename TC>
int GetMultiplicity(CHomomorphism<TD,TC> &H,int Index)
   {
      int _multiplicity=0;
      
      for(int c=0;c<H.Morphisms();c++)
      {
         CMorphism<TD,TC> _m;
         if(H.Get(c,_m))
         {
            if(_m.Codomain()==Index){ _multiplicity++; }
         }
      }
      
      return(_multiplicity);
   }
//+------------------------------------------------------------------+
