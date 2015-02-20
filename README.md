1. install packer: 

https://www.packer.io/downloads.html

copy windows ISO's to ../iso/

remote-*  all use a vcenter server.

Administrator password: 'password'


to build:

packer build --only=vmware-iso win2012r2-standard.json

Will take +- 10 minutes when done you should have a vm created in output-vmware-iso

