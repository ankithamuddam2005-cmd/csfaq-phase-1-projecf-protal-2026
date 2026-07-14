# Samagama API Documentation

## Base URL
```
http://localhost:5000/api
```

## Authentication
All protected endpoints require a JWT token in the Authorization header:
```
Authorization: Bearer <your_jwt_token>
```

## Knowledge Base Endpoints

### Get All Articles
```
GET /kb/articles
Query Parameters:
  - page: number (default: 1)
  - limit: number (default: 20)
  - category: string (optional)
  - tags: string[] (optional)
```

### Get Article by ID
```
GET /kb/articles/:id
```

### Create Article (Admin Only)
```
POST /kb/articles
Body:
{
  "title": "string",
  "content": "string",
  "category": "string",
  "tags": ["string"]
}
```

### Update Article (Admin Only)
```
PUT /kb/articles/:id
Body: Same as Create
```

### Delete Article (Admin Only)
```
DELETE /kb/articles/:id
```

### Semantic Search
```
GET /kb/search
Query Parameters:
  - q: string (search query)
  - limit: number (default: 10)
```

## Q&A Board Endpoints

### Get All Questions
```
GET /qa/questions
Query Parameters:
  - page: number (default: 1)
  - limit: number (default: 20)
  - tags: string[] (optional)
  - sort: string (newest, trending, unanswered)
```

### Create Question
```
POST /qa/questions
Body:
{
  "title": "string",
  "description": "string",
  "tags": ["string"]
}
```

### Post Answer
```
POST /qa/questions/:id/answers
Body:
{
  "content": "string"
}
```

### Vote on Question
```
POST /qa/questions/:id/vote
Body:
{
  "type": "upvote" | "downvote"
}
```

## Authentication Endpoints

### Register
```
POST /auth/register
Body:
{
  "username": "string",
  "email": "string",
  "password": "string",
  "firstName": "string",
  "lastName": "string"
}
```

### Login
```
POST /auth/login
Body:
{
  "email": "string",
  "password": "string"
}
Response:
{
  "token": "string",
  "user": { ... }
}
```

### Logout
```
POST /auth/logout
```

## Error Responses

### 400 Bad Request
```
{
  "error": "Invalid request parameters",
  "details": [...]
}
```

### 401 Unauthorized
```
{
  "error": "Authentication required"
}
```

### 403 Forbidden
```
{
  "error": "Insufficient permissions"
}
```

### 404 Not Found
```
{
  "error": "Resource not found"
}
```

### 500 Internal Server Error
```
{
  "error": "Internal server error",
  "message": "Error details"
}
```
