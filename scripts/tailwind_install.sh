#! bin/bash
### This is a script that will allow for tailwind config to be pulled as a module, reducing the size of the main .sh.
### This file should be installed in the following location on the EC2 instance "/tmp/react-files"
cat <<EOF > tailwind.config.js
module.exports = {
    content: ["./index.html", "./src/**/*{js,ts,jsx,tsx}"],
    theme: { extends {} },
    plugins: [],
}
EOF
cat << EOF > src/index.css
@tailwindbase;
@tailwind components;
@tailwind utilities;
EOF