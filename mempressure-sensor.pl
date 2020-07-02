#!/usr/bin/perl -w

# use Data::Dumper qw(Dumper);

$|=1;

print "ksysguardd 1.2.0\n";
print "ksysguardd> ";


sub getprocinfo {
    my ($file) = @_;
    # arg1 = ; # file "memory, cpu, or io"
    my $filepath = "/proc/pressure/${file}";

    open(my $yourhandle, '<', $filepath) # always use a variable here containing filename
    or die "Unable to open file, $!";


    my %data = ();

    while (my $line = <$yourhandle>) { # Read the file line per line (or otherwise, it's configurable).
    chomp($line);

    # print "in: ${line}-\n";
    my @in = split(/\s+/, $line);
    # print Dumper \%line;
    
    my $type = $in[0];
    splice(@in, 0, 1);
    # print "split: @in\n";

    foreach $prop (@in) {
    # print "iter: $prop\n";
    ($key, @value) = split /=/, $prop;
    # print "$type, $key = @value\n";
    $data{$type}{$key} = "@value";
    
    }
    }
    close($yourhandle)
    or warn "Unable to close the file handle: $!";

    # print Dumper \%data;
    return %data;
}

while(<>){
    if(/monitors/){
        print "Pressure/Memory/m_some_10sec\tfloat\n";
        print "Pressure/Memory/m_some_60sec\tfloat\n";
        print "Pressure/Memory/m_some_300sec\tfloat\n";
        print "Pressure/Memory/m_some_total\tinteger\n";
        print "Pressure/Memory/m_full_10sec\tfloat\n";
        print "Pressure/Memory/m_full_60sec\tfloat\n";
        print "Pressure/Memory/m_full_300sec\tfloat\n";
        print "Pressure/Memory/m_full_total\tinteger\n";

        print "Pressure/CPU/c_some_10sec\tfloat\n";
        print "Pressure/CPU/c_some_60sec\tfloat\n";
        print "Pressure/CPU/c_some_300sec\tfloat\n";
        print "Pressure/CPU/c_some_total\tinteger\n";
        print "Pressure/CPU/c_full_10sec\tfloat\n";
        print "Pressure/CPU/c_full_60sec\tfloat\n";
        print "Pressure/CPU/c_full_300sec\tfloat\n";
        print "Pressure/CPU/c_full_total\tinteger\n";

        print "Pressure/IO/i_some_10sec\tfloat\n";
        print "Pressure/IO/i_some_10sec\tfloat\n";
        print "Pressure/IO/i_some_10sec\tfloat\n";
        print "Pressure/IO/i_some_total\tinteger\n";
        print "Pressure/IO/i_full_10sec\tfloat\n";
        print "Pressure/IO/i_full_10sec\tfloat\n";
        print "Pressure/IO/i_full_10sec\tfloat\n";
        print "Pressure/IO/i_full_total\tinteger\n";
    }
    

    ##     ## ######## ##     ##  #######  ########  ##    ## 
    ###   ### ##       ###   ### ##     ## ##     ##  ##  ##  
    #### #### ##       #### #### ##     ## ##     ##   ####   
    ## ### ## ######   ## ### ## ##     ## ########     ##    
    ##     ## ##       ##     ## ##     ## ##   ##      ##    
    ##     ## ##       ##     ## ##     ## ##    ##     ##    
    ##     ## ######## ##     ##  #######  ##     ##    ##    


    if(/m_some_10sec/){
        if(/\?/){
            print "Some (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'some'}{'avg10'}\n");
        }
    }
    if(/m_some_60sec/){
        if(/\?/){
            print "Some (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'some'}{'avg60'}\n");
        }
    }
    if(/m_some_300sec/){
        if(/\?/){
            print "Some (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'some'}{'avg300'}\n");
        }
    }
    if(/m_some_total/){
        if(/\?/){
            print "Some Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'some'}{'total'}\n");
        }
    }
    if(/m_full_10sec/){
        if(/\?/){
            print "Full (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'full'}{'avg10'}\n");
        }
    }
    if(/m_full_60sec/){
        if(/\?/){
            print "Full (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'full'}{'avg60'}\n");
        }
    }
    if(/m_full_300sec/){
        if(/\?/){
            print "Full (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'full'}{'avg300'}\n");
        }
    }
    if(/m_full_total/){
        if(/\?/){
            print "Full Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "memory" );  
            print("$data{'full'}{'total'}\n");
        }
    }


     ######  ########  ##     ##                              
    ##    ## ##     ## ##     ##                              
    ##       ##     ## ##     ##                              
    ##       ########  ##     ##                              
    ##       ##        ##     ##                              
    ##    ## ##        ##     ##                              
     ######  ##         ####### 

    if(/c_some_10sec/){
        if(/\?/){
            print "Some (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'some'}{'avg10'}\n");
        }
    }
    if(/c_some_60sec/){
        if(/\?/){
            print "Some (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'some'}{'avg60'}\n");
        }
    }
    if(/c_some_300sec/){
        if(/\?/){
            print "Some (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'some'}{'avg300'}\n");
        }
    }
    if(/c_some_total/){
        if(/\?/){
            print "Some Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'some'}{'total'}\n");
        }
    }
    if(/c_full_10sec/){
        if(/\?/){
            print "Full (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'full'}{'avg10'}\n");
        }
    }
    if(/c_full_60sec/){
        if(/\?/){
            print "Full (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'full'}{'avg60'}\n");
        }
    }
    if(/c_full_300sec/){
        if(/\?/){
            print "Full (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'full'}{'avg300'}\n");
        }
    }
    if(/c_full_total/){
        if(/\?/){
            print "Full Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            print("$data{'full'}{'total'}\n");
        }
    }

    ####  #######                                             
     ##  ##     ##                                            
     ##  ##     ##                                            
     ##  ##     ##                                            
     ##  ##     ##                                            
     ##  ##     ##                                            
    ####  ####### 

    if(/i_some_10sec/){
        if(/\?/){
            print "Some (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'some'}{'avg10'}\n");
        }
    }
    if(/i_some_60sec/){
        if(/\?/){
            print "Some (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'some'}{'avg60'}\n");
        }
    }
    if(/i_some_300sec/){
        if(/\?/){
            print "Some (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'some'}{'avg300'}\n");
        }
    }
    if(/i_some_total/){
        if(/\?/){
            print "Some Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'some'}{'total'}\n");
        }
    }
    if(/i_full_10sec/){
        if(/\?/){
            print "Full (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'full'}{'avg10'}\n");
        }
    }
    if(/i_full_60sec/){
        if(/\?/){
            print "Full (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'full'}{'avg60'}\n");
        }
    }
    if(/i_full_300sec/){
        if(/\?/){
            print "Full (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'full'}{'avg300'}\n");
        }
    }
    if(/i_full_total/){
        if(/\?/){
            print "Full Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "io" );  
            print("$data{'full'}{'total'}\n");
        }
    }
    
    print "ksysguardd> ";
}