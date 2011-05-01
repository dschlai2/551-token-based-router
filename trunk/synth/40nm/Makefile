all:
	rm -rf *.transcript
	design_vision -f tx.script > tx.transcript 
	design_vision -f rx.script > rx.transcript
	design_vision -f core.script > core.transcript
	cat *.transcript | grep Error
	

