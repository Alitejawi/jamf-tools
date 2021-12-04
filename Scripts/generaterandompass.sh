$ openssl rand -base64 30
qb8ZWbUU2Ri3FOAPY/1wKSFAJwMXmpQM4mZU4YbO

$ gpg --gen-random -a 0 90 | fold -w 40
3e+kfHOvovHVXxZYPgu+OOWQ1g1ttbljr+kNGv7f
loD//RsjUXYGIjfPM/bT0itsoEstyGLVUsFns8wP
zYM8VRBga+TsnxWrS7lWKfH1uvVPowzkq9kXCdvJ

$ LANG=C tr -dc 'A-F0-9' < /dev/urandom | fold -w 40 | head -n 5
45D0371481EE5E5A5C1F68EA59E69F9CA52CB321
A30B37A00302643921F205621B145E7EAF520164
B6EF38A2DA1D0586D20105502AFFF0468EA5F16A
029D6EA9F76CD64D3356E342EA154BEFEBE23387
07F468F0569579A0A06471247CABC4F4C1386E24

$ tr -dc '[:alnum:]' < /dev/urandom | fold -w 40 | head -n5
zmj8S0iuxud8y8YHjzdg7Hefu6U1KAYBiLl3aE8v
nCNpuMkWohTjQHntTzbiLQJG5zLzEHWSWaYSwjtm
R2L6M909S3ih852IkJqQFMDawCiHcpPBxlllAPrt
aZOXKVUmxhzQwVSYb6nqAbGTVMFSJOLf094bFZAb
HfgwSNlkVBXwIPQST6E6x6vDNCCasMLSSOoTUfSK

$ tr -dc '[:lower:]' < /dev/urandom | fold -w 40 | head -n5
gfvkanntxutzwxficgvavbwdvttexdezdftvvtmn
lgrsuiugwkqbtbkyggcbpbqlynwbiyxzlabstqcf
ufctdlsbyonkowzpmotxiksnsbwdzkjrjsupoqvr
hjwibdjxtmuvqricljayzkgdfztcmapsgwsubggr
bjstlmvwjczakgeetkbmwbjnidbeaerhaonpkacg

$ tr -dc '[:upper:]' < /dev/urandom | fold -w 40 | head -n5
EUHZMAOBOLNFXUNNDSTLJTPDCPVQBPUEQOLRZUQZ
HVNVKBEPAAYMXRCGVCNEZLFHNUYMRYPTWPWOOZVM
TAHEUPQJTSYQVJVYSKLURESMKWEZONXLUDHWQODB
PRDITWMAXXZLTRXEEOGOSGAWUXYDGDRJYRHUWICM
VHERIQBLBPHSIUZSGYZRDHTNAPUGJMRODIKBWZRJ

$ tr -dc '[:graph:]' < /dev/urandom | fold -w 40 | head -n5
n\T2|zUz:\C,@z9!#p3!B/[t6m:B94}q&t(^)Ol~
J%MMDbAgGdP}zrSQO!3mrP3$w!.[Ng_xx-_[C<3g
^)6V&*<2"ZOgU.mBd]iInvFKiT<dq~y\O[cdDK`V
+RE]UYPIf3:StX`y#w,.iG~g"urD)'FnDIFI_q^)
6?HRillpgvvFDBAr4[:H{^oAL<`Em7$roF=2w;1~