#! bin/bash
### This script is to install and run an Nginx server on an Ec2 providing the front end for the service catalogue ###
set -ex

### Re-usable Vars ###
APP_NAME="product-catalogue"
APP_DIR="$HOME/apps"

echo ">>> Installing packages"
bash /tmp/react-files/package-install.sh
### Create React App Folders ### mkdir -p SAPP_DIR
cd $APP_DIR

npm create vite@latest $APP_NAME —- --template react -y 
cd $APP_ NAME
npm install
npm install react-router-dom
npm install -D tailwindcss@3.4.1 postcss autoprefixer 
npx tailwindcss init -p

#### Config Tailwind ### 
echo ">>> Configuring Tailwind"
bash /tmp/react-files/tailwind-config.sh

#### Create App-jsx ### echo "›»> Creating Application"
cp / tmp/react-files/App-jsx. template src/App. jsx

### Move Images###
echo ">»> Creating Image Files"
mkdir public/images
cp . ./../images/ec2.png public/images 
cp ../.. /images/S3.png public/images
CP ../../images/R53. svg public/images

npm run build
sudo cp -r dist/* /usr/share/nginx/html/

### Start NGINX ##
sudo systemctl start nginx 
sudo systemctl enable nginx
