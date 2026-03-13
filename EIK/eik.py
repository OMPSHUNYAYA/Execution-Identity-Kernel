import sys,json,hashlib,subprocess
if len(sys.argv)<2:print("Usage: python eik.py target.py [--line x ...] [-- args]");raise SystemExit(1)
t=sys.argv[1];a=[];L=[];i=2
while i<len(sys.argv):
 x=sys.argv[i]
 if x=="--line":L.append(sys.argv[i+1]);i+=2
 elif x=="--":a=sys.argv[i+1:];break
 else:a.append(x);i+=1
s="\n".join(L)+("\n"if L else"")
if not L and not sys.stdin.isatty():s=sys.stdin.read()
th=hashlib.sha256(open(t,"rb").read()).hexdigest()
p=subprocess.run([sys.executable,t]+a,input=s,capture_output=True,text=True)
m={"argv":a,"exit_code":p.returncode,"stderr_text":p.stderr,"stdin_text":s,"stdout_text":p.stdout,"target_sha256":th}
h=hashlib.sha256(json.dumps(m,sort_keys=True,separators=(",",":")).encode()).hexdigest()
if p.stdout:print(p.stdout,end="")
if p.stdout and not p.stdout.endswith("\n"):print()
if p.stderr:print(p.stderr,end="",file=sys.stderr)
print("EIK_MANIFEST_SPEC\nv1\n\nEIK_EXECUTION_CERTIFICATE")
print(h)