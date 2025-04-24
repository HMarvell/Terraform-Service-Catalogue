#! bin/bash

APP_NAME="product-catalogue"
DIR="<location of Folder>"
APP_DIR="$DIR/app"
mkdir -p $APP_DIR
cd $APP_DIR

npm create vite@latest $APP_NAME —- —-template react
cd $APP_NAME
npm install

npm install react-router-dom
npm install -D tailwindcss@3.4.1 postcss autoprefixer
npx tailwindcss init -p

### Configure Tailwind ###
echo ">>> Configuring Tailwind"
bash $DIR/tailwind_config.sh

### Create App.JSX ###
echo "»»> Creating Application"
cp $DIR/App.jsx.template src/App.jsx
mkdir public/images
cp . ./../images/ec2.png public/images
cp ../.. /images/53-png public/images
cp ../. /images/R53.svg public/images

npm run build

cp -r dist/* /opt/homebrew/var/ww/

nginx