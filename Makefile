# this makes sure libraries are installed and up-to-date (with requirements.txt)
venv: venv/bin/activate
 
venv/bin/activate: requirements.txt
	test -d venv || virtualenv venv
	. venv/bin/activate && pip install -Ur requirements.txt
	touch venv/bin/activate
