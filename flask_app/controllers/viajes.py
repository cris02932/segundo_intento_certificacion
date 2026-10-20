from flask_app import app
from flask import render_template, session, redirect
from flask_app.models.usuario import Usuario

@app.route('/nuevo_viaje')
def nuevo_viaje():
    if 'usuario_id' not in session:
        return redirect('/')
    print(session['usuario_id'])
    usuario_en_sesion = Usuario.get_one({
        'id': session['usuario_id']
    })
    return render_template('nuevo.html', usuario=usuario_en_sesion)
