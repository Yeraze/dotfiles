export PATH=/opt/homebrew/bin:~/bin:${PATH}
export PATH=/usr/local/krb5/bin:/usr/local/ossh/bin:${PATH}
export PDSH_SSH_ARGS="-o LOGLEVEL=QUIET -x"

PATH="/Users/rhand/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/rhand/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/rhand/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/rhand/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/rhand/perl5"; export PERL_MM_OPT;
