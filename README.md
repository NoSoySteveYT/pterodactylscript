# Script Support
| Operating System |  Version  |Supported|
|------------------|-----------|---------|
|   Ubuntu         |    18.04  |   ✅    |
|				   |	20.04  |   ✅    |
|	CentOS		   |	7	   |   ❌	 |
|				   |	8      |   ❌   |
|	Debian  	   |    9      |   ❌    |
|				   |   10      |   ❌   |

# Script Nuevo

```bash
cd;git clone https://github.com/MizuThz/Pterodactyl-install-script.git;chmod -R 750 Pterodactyl-install-script;cd Pterodactyl-install-script;sh Install.sh
```
# Script Antiguo 
recomiendo usar el script con menus, este scrip es instala el panel con webserver nginx y http sin dominio el script nuevo es mas completo

###### Ubuntu
*apt -y install curl*

*apt -y install tar*

Contraseña de Mysql '3205829086'

```bash
cd;curl -Lo panel.tar https://github.com/MizuThz/Pterodactyl-install-script/releases/latest/download/panel.tar;tar -xvf panel.tar;chmod -R 750 panel;cd panel;sh install.sh;cd /var/www/pterodactyl;sh depends.sh
```

# Wings

###### AMD64

```bash
cd /var/www/pterodactyl;sh wings_AMD64.sh
```

###### ARM64 / AARCH64

```bash
cd /var/www/pterodactyl;sh wings_ARM64_AARCH64.sh
```
