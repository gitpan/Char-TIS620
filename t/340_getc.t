# This file is encoded in TIS-620.
die "This file is not encoded in TIS-620.\n" if q{��} ne "\x82\xa0";

use Char::TIS620 qw(getc);
print "1..1\n";

my $__FILE__ = __FILE__;

my @getc = ();
while (my $c = getc(DATA)) {
    last if $c =~ /\A[\r\n]\z/;
    push @getc, $c;
}
my $result = join('', map {"($_)"} @getc);

if ($result eq '(1)(2)(�)(�)') {
    print "ok - 1 $^X $__FILE__ 12�� --> $result.\n";
}
else {
    print "not ok - 1 $^X $__FILE__ 12�� --> $result.\n";
}

__END__
12��
