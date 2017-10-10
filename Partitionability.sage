#######à Partitionability

def make_list_var(P):
	l=[]
	for i in range(len(P.maximal_elements())):
		for j in range(len(P)):
			if set(P[j])<=set(P.maximal_elements()[i]):
				l.append([P[j],P.maximal_elements()[i],2^(len(P.maximal_elements()[i])-1-len(P[j])+1)])
	return l			

def make_constraints(P,l,p):
	c=[]
	for i in range(len(l)):
		for j in range(i+1,len(l)):
			if set(P.closed_interval(l[i][0],l[i][1])) & set(P.closed_interval(l[j][0],l[j][1]))!=set():
				p.add_constraint(w[i]+w[j]<= 1)
	return c
	
def objective_fun(l):
	f=0
	for i in range(len(l)):
		f=f+l[i][2]*w[i]		
	return f
	
	



