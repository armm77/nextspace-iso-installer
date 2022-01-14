# nextspace-iso-installer
It is an [ISO](https://drive.google.com/file/d/1QNp9FvlbprhyVvC_pVQYPAk_OvHoOUtJ/view?usp=sharing) image of CentOS Stream 8, modified to make an easy installation of the [NEXTSPACE](https://github.com/trunkmaster/nextspace) desktop project.

## Characteristics:
* Minimal installation.
* Default user configured `me` and his password is `nextspace`.
* Normal and custom installation (image and style changes only).
* It only allows NON-UEFI installation. 
* Installation time 17 min.
* Installed packages will be updated frequently from [nextspace-packages](https://github.com/armm77/nextspace-packages)

## To fix.
* UEFI installation.
* Fix nextspace plymouth theme booting. (plymouth-set-default-theme -R nextspace)
* Speed up installation time.
