#!/bin/bash

# 프로젝트 이름 입력 받기 및 검증
while true; do
    echo "Enter project name (lowercase letters, numbers, and hyphens only):"
    read project_name
    if [[ $project_name =~ ^[a-z0-9-]+$ ]]; then
        break
    else
        echo "Invalid project name. Please try again."
    fi
done

# 프로젝트 디렉토리 생성
mkdir "$project_name"
cd "$project_name"

# 필요한 디렉토리 생성
mkdir -p src/{config,controllers,middlewares,models,routes,services,utils}
mkdir -p public/{css,js,images}
mkdir views tests

# package.json 생성 (의존성 부분은 비워둠)
cat > package.json << EOF
{
  "name": "$project_name",
  "version": "1.0.0",
  "main": "web.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node web.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": "",
  "dependencies": {}
}
EOF

# 기본 파일 생성
touch src/config/database.js
touch src/controllers/userController.js
touch src/middlewares/auth.js
touch src/models/userModel.js
touch src/routes/userRoutes.js
touch src/services/{encryptionService.js,userService.js}
touch src/utils/validators.js
touch web.js

# 필요한 패키지 설치
npm install express bcrypt dotenv

echo "Project structure created successfully!"