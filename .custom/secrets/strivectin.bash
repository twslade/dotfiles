clean-css(){
	git checkout ~/sites/strivectin.local/html/skin/frontend/enterprise/strivectin/css/*.css
}

watch-sass(){
	cd ~/sites/strivectin.local/html/skin/frontend/enterprise/strivectin/sass && compass watch .
}

strivectin-prime-cache(){
	~/applications/wfpc/wfpc -w https://www.strivectin.com/sitemap.xml
}

strivectin-sync-media(){
	rsync -rvzu --exclude="*cache*" --exclude="shoprunner/*" --exclude="css/*" --exclude="js/*" --exclude="import/*" --exclude="css_secure/*" --exclude="*tmp*" --exclude="*zip" --exclude="*gz" --exclude="*tar" --exclude="*bz2" strivectin-web-1:/home/strivect/strivectin.com/shared/media/* /home/thomas/sites/strivectin.local/html/media/
}

strivectin-merge-into-and-deploy-develop(){
	 cd ~/sites/strivectin.local/dev && git checkout develop && git merge --no-edit - && git push origin HEAD && cap staging deploy BRANCH=develop
}
