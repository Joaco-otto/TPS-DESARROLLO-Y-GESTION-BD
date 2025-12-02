# Proyecto Auto - TP Spring Boot

Este proyecto implementa una aplicación web completa usando Spring Boot para el manejo de autos, cumpliendo con todos los requerimientos del TP.

## Características Implementadas

### a) Arquitectura Spring Boot
- **Capas completas**: modelo, controller, dto, service y repository
- **Configuración Maven** con todas las dependencias necesarias
- **Base de datos MySQL** configurada

### b) Operaciones CRUD con JPA/Hibernate
- **GET**: Obtener todos los autos, obtener auto por ID, buscar por rango de precio
- **POST**: Crear nuevos autos
- **PUT**: Actualizar autos existentes
- **DELETE**: Eliminar autos

#### Method Queries implementados:
1. `Optional<Auto> findByMarca(String marca)` - Utilizado para reglas de negocio
2. `List<Auto> findByPrecioBetween(Double precioMin, Double precioMax)` - Expuesto en endpoint

### c) Regla de Negocio en la Entidad
- **Precio no negativo**: Implementado en el setter de `precio` en la clase `Auto`
- Lanza `IllegalArgumentException` si se intenta asignar precio negativo

### d) DTO y Mapper
- **AutoRequestDTO**: Incluye validación de marca no vacía
- **AutoMapper**: Conversiones entre DTO y entidad
- **No hay ResponseAutoDTO** según requerimientos

### e) Regla de Negocio en el Servicio
- **No autos duplicados con la misma marca**: Utiliza `findByMarca()` method query
- Validación en `saveAuto()` y `editAuto()`

## Estructura del Proyecto

```
src/
├── main/
│   ├── java/ar/edu/centro8/desarrollo/proyectoauto/
│   │   ├── ProyectoAutoApplication.java
│   │   ├── controller/
│   │   │   └── AutoController.java
│   │   ├── dto/
│   │   │   ├── AutoRequestDTO.java
│   │   │   └── AutoMapper.java
│   │   ├── model/
│   │   │   └── Auto.java
│   │   ├── repository/
│   │   │   └── IAutoRepository.java
│   │   └── service/
│   │       ├── IAutoService.java
│   │       └── AutoService.java
│   └── resources/
│       └── application.properties
└── test/
```

## Configuración de Base de Datos

1. Crear base de datos MySQL:
```sql
CREATE DATABASE proyecto_auto;
```

2. Configurar credenciales en `application.properties`:
```properties
spring.datasource.username=root
spring.datasource.password=1234
```

## Endpoints de la API

### GET /api/autos
Obtiene todos los autos

### GET /api/autos/{id}
Obtiene un auto por ID

### POST /api/autos
Crea un nuevo auto
```json
{
    "marca": "Toyota",
    "modelo": "Corolla",
    "año": 2023,
    "precio": 25000.0,
    "color": "Blanco"
}
```

### PUT /api/autos/{id}
Actualiza un auto existente

### DELETE /api/autos/{id}
Elimina un auto

### GET /api/autos/precio?min={min}&max={max}
Busca autos por rango de precio

## Validaciones Implementadas

### En AutoRequestDTO:
- Marca no puede estar vacía
- Modelo no puede estar vacío
- Año debe ser positivo
- Precio no puede ser negativo

### En la Entidad Auto:
- Precio no puede ser negativo (setter personalizado)

### En el Servicio:
- No permite autos duplicados con la misma marca

## Cómo Ejecutar

1. Asegúrate de tener MySQL ejecutándose
2. Crea la base de datos `proyecto_auto`
3. Ejecuta el proyecto:
```bash
./mvnw spring-boot:run
```

El servidor se iniciará en `http://localhost:8080`

## Tecnologías Utilizadas

- Spring Boot 3.5.0
- Spring Data JPA
- Hibernate
- MySQL
- Lombok
- Maven
- Java 21