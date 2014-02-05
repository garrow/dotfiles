alias __spec_dirs='find spec -type d -d 1'
alias __fast_spec_dirs='__spec_dirs | grep -v acceptance'
alias fs='time rspec `__fast_spec_dirs`'
alias ss=__rspec_filter_phantomjs_crap


function __rspec_filter_phantomjs_crap()
{
  time rspec $@ spec/acceptance 2> >(grep -v CoreText 1>&2)
}
