from flask import Flask, render_template,request,abort

app = Flask(__name__)

@app.route('/index', methods = ['GET', 'POST'])
def index():
    if request.method == 'GET':
        return render_template('index.html')
    if request.method =='POST':
        name = request.form.get('name')
        password = request.form .get('password')
        if name =='zhanshan' and password =='123':
            return 'login success'
        else:
            abort(404)
            return None

#自定义错误处理方法
@app.errorhandler(404)
def handle_404_error(err):
    return '出现了404错误 错误信息是%s'%err

if __name__ == '__main__':
    app.run()
