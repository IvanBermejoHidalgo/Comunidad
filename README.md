# 🏢 Gestión de Comunidad

Aplicación web desarrollada en Java que permite gestionar comunidades de propietarios, sus propiedades, propietarios, zonas comunes y gastos. El objetivo es facilitar la organización y presentación de información relativa a cada comunidad a partir de archivos `.txt` cargados por el usuario.

---

## 📌 Funcionalidades principales

- Subida de archivos `.txt` con los datos de la comunidad y los gastos.
- Procesamiento y almacenamiento de los datos en memoria durante la sesión.
- Visualización de las propiedades, propietarios y porcentajes por zona.
- Cálculo de gastos distribuidos por propiedad.
- Interfaz clara y estilizada con formularios y tablas.
- Navegación entre vistas mediante enlaces internos.

---

## 🧱 Estructura del proyecto
```bash
Comunidad/
├── src/
│ ├── main/java/
│ │ ├── controllers/ # Servlets (AuthController.java, PostController.java)
│ │ ├── models/ # Clases (Usuario.java, Post.java)
│ │ └── utils/ # Utilidades (Database.java, SessionUtils.java)
│ ├── main/webapp/
│ │ ├── WEB-INF/ # web.xml
│ │ ├── assets/ # CSS/JS/imágenes
│ │ └── views/ # JSPs (login.jsp, home.jsp, profile.jsp)
├── database/ # Scripts SQL (si aplica)
└── README.md
```

---

## Contacto

- **Nombre:** Sara Essakkal Martínez | Iván Bermejo Hidalgo
- **Email:** sessakkal@elpuig.xeill.net | ibermejo@elpuig.xeill.net
