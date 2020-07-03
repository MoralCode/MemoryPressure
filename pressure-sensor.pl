#!/usr/bin/perl -w
use feature 'say';
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
        print "Memory/m_some_10sec\tfloat\n";
        print "Memory/m_some_60sec\tfloat\n";
        print "Memory/m_some_300sec\tfloat\n";
        print "Memory/m_some_total\tinteger\n";
        print "Memory/m_full_10sec\tfloat\n";
        print "Memory/m_full_60sec\tfloat\n";
        print "Memory/m_full_300sec\tfloat\n";
        print "Memory/m_full_total\tinteger\n";

        print "CPU/c_some_10sec\tfloat\n";
        print "CPU/c_some_60sec\tfloat\n";
        print "CPU/c_some_300sec\tfloat\n";
        print "CPU/c_some_total\tinteger\n";
        print "CPU/c_full_10sec\tfloat\n";
        print "CPU/c_full_60sec\tfloat\n";
        print "CPU/c_full_300sec\tfloat\n";
        print "CPU/c_full_total\tinteger\n";

        print "IO/i_some_10sec\tfloat\n";
        print "IO/i_some_60sec\tfloat\n";
        print "IO/i_some_300sec\tfloat\n";
        print "IO/i_some_total\tinteger\n";
        print "IO/i_full_10sec\tfloat\n";
        print "IO/i_full_600sec\tfloat\n";
        print "IO/i_full_300sec\tfloat\n";
        print "IO/i_full_total\tinteger\n";
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
            say("$data{'some'}{'avg10'}");
        }
    }
    if(/m_some_60sec/){
        if(/\?/){
            print "Some (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'some'}{'avg60'}");
        }
    }
    if(/m_some_300sec/){
        if(/\?/){
            print "Some (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'some'}{'avg300'}");
        }
    }
    if(/m_some_total/){
        if(/\?/){
            print "Some Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'some'}{'total'}");
        }
    }
    if(/m_full_10sec/){
        if(/\?/){
            print "Full (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'full'}{'avg10'}");
        }
    }
    if(/m_full_60sec/){
        if(/\?/){
            print "Full (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'full'}{'avg60'}");
        }
    }
    if(/m_full_300sec/){
        if(/\?/){
            print "Full (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'full'}{'avg300'}");
        }
    }
    if(/m_full_total/){
        if(/\?/){
            print "Full Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "memory" );  
            say("$data{'full'}{'total'}");
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
            say("$data{'some'}{'avg10'}");
        }
    }
    if(/c_some_60sec/){
        if(/\?/){
            print "Some (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'some'}{'avg60'}");
        }
    }
    if(/c_some_300sec/){
        if(/\?/){
            print "Some (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'some'}{'avg300'}");
        }
    }
    if(/c_some_total/){
        if(/\?/){
            print "Some Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'some'}{'total'}");
        }
    }
    if(/c_full_10sec/){
        if(/\?/){
            print "Full (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'full'}{'avg10'}");
        }
    }
    if(/c_full_60sec/){
        if(/\?/){
            print "Full (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'full'}{'avg60'}");
        }
    }
    if(/c_full_300sec/){
        if(/\?/){
            print "Full (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'full'}{'avg300'}");
        }
    }
    if(/c_full_total/){
        if(/\?/){
            print "Full Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "cpu" );  
            say("$data{'full'}{'total'}");
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
            say("$data{'some'}{'avg10'}");
        }
    }
    if(/i_some_60sec/){
        if(/\?/){
            print "Some (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'some'}{'avg60'}");
        }
    }
    if(/i_some_300sec/){
        if(/\?/){
            print "Some (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'some'}{'avg300'}");
        }
    }
    if(/i_some_total/){
        if(/\?/){
            print "Some Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'some'}{'total'}");
        }
    }
    if(/i_full_10sec/){
        if(/\?/){
            print "Full (10-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'full'}{'avg10'}");
        }
    }
    if(/i_full_60sec/){
        if(/\?/){
            print "Full (60-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'full'}{'avg60'}");
        }
    }
    if(/i_full_300sec/){
        if(/\?/){
            print "Full (300-sec)\t0\t100\t%\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'full'}{'avg300'}");
        }
    }
    if(/i_full_total/){
        if(/\?/){
            print "Full Stall Time\t0\t0\tus\n";
        }else{
            my %data = getprocinfo( "io" );  
            say("$data{'full'}{'total'}");
        }
    }

    print "ksysguardd> ";
}