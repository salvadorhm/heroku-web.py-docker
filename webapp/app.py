import os
import web # libreria para usar el framework web.py

urls = (
    '/', 'Index',
)

app = web.application(urls, globals()) # configura las urls en la aplicacion web
wsgiapp = app.wsgifunc()
render = web.template.render('views', base='layout') # configura la carpeta donde estan las vistas (archivos html)

class Index:
    def GET(self):
        return render.index()

if __name__ == "__main__":
    web.config.debug = False # Activa o desactiva el modo de repuracion de firebase
    app.run() # ejecuta al web app
