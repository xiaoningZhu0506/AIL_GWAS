Aurora:
open READ1,"$ARGV[0]";
open READ2,"$ARGV[1]";
open SAMPLE,"$ARGV[2]";
%hash;
while (<SAMPLE>){
        chomp;
        ($sample,$index) = split /\t/,$_;
        $xr1 = $sample."1";
        $xr2 = $sample."2";
        open $xr1 ,">$sample\_1.fq";
        open $xr2 ,">$sample\_2.fq";
        $hash{$index} = $sample;
}
while(<READ1>){
        chomp;
        $name1 = $_;
        chomp($seq1=<READ1>);
        chomp($plus1=<READ1>);
        chomp($qual1=<READ1>);
        chomp($name2=<READ2>);
        chomp($seq2=<READ2>);
        chomp($plus2=<READ2>);
        chomp($qual2=<READ2>);
        ($readn,$index_read) = split / /,$name1;
        if(defined($hash{$index_read})){
                $yr1 = $hash{$index_read}."1";
                $yr2 = $hash{$index_read}."2";
                print $yr1 "$name1\n$seq1\n$plus1\n$qual1\n";
                print $yr2 "$name2\n$seq2\n$plus2\n$qual2\n";
        }
}

