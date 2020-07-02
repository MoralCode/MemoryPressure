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
        # print "gpu_temp\tinteger\n";
        # print "gpu_fan_speed\tinteger\n";
        # print "gpu_core_usage\tinteger\n";
        # print "gpu_core_clock\tinteger\n";
        # print "gpu_mem_mib\tinteger\n";
        # print "gpu_mem_clock\tinteger\n";
        # print "gpu_video_decode\tinteger\n";
        # print "gpu_video_encode\tinteger\n";
    }
    # if(/gpu_temp/){
    #     if(/\?/){
    #         print "GPU Temp\t0\t100\t°C\n";
    #     }else{
    #         print `nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_fan_speed/){
    #     if(/\?/){
    #         print "GPU Fan Speed\t0\t100\t%\n";
    #     }else{
    #         print `nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_core_usage/){
    #     if(/\?/){
    #         print "GPU Core Usage\t0\t100\t%\n";
    #     }else{
    #         print `nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_core_clock/){
    #     if(/\?/){
    #         print "GPU Core Clock\t0\t2500\tMhz\n";
    #     }else{
    #         print `nvidia-smi --query-gpu=clocks.current.graphics --format=csv,noheader,nounits` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_mem_mib/){
    #     if(/\?/){
    #         print "GPU Memory Usage\t0\t".`lsmod | grep -q nvidia && nvidia-smi --query-gpu=memory.total --format=csv,noheader,nounits | perl -pe 'chomp'`."\tMiB\n";
    #     }else{
    #         print `nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_mem_clock/){
    #     if(/\?/){
    #         print "GPU Memory Clock\t0\t8000\tMhz\n";
    #     }else{
    #         print `nvidia-smi --query-gpu=clocks.current.memory --format=csv,noheader,nounits` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_video_decode/){
    #     if(/\?/){
    #         print "GPU Decoding\t0\t100\t%\n";
    #     }else{
    #         print `nvidia-smi dmon -c 1 -s u | sed s/#// | awk '{print \$5}' | tail -n 1` unless $no_nvidia;
    #     }
    # }
    # if(/gpu_video_encode/){
    #     if(/\?/){
    #         print "GPU Encoding\t0\t100\t%\n";
    #     }else{
    #         print `nvidia-smi dmon -c 1 -s u | sed s/#// | awk '{print \$4}' | tail -n 1` unless $no_nvidia;
    #     }
    # }
    print "ksysguardd> ";
}