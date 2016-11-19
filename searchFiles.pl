#!/usr/bin/perl
#use strict;
use warnings;
use File::Basename;
use feature qw(say);
 
die "Usage: $0 <Path to text files> <Path to output file> <String to search> \n" if not @ARGV;

my $directory = $ARGV[0];
my $outputFile = $ARGV[1];
my @exts = qw(.txt);
my $count=0;
my $string = $ARGV[2];

open my $outputPath, ">>", "$outputFile";
opendir $dir, "$directory" or die "Can't open directory";

chdir $directory;

print  "Running search on \"$string\"\n";
print  "Files found:\n\n";

while ( my $file = readdir ($dir)) {
	my ($name, $dir, $ext) = fileparse($file, @exts);
	next unless $ext eq".txt";
	my $fn = "$file";
	open($fn, '<', $file) or die " $!";
    while (my $line = <$fn>) {
        if ($line =~ /$string/) {
            $count = $count +1;
        }
    }
     if ($count > 0){
        	print $file."\n";
        }
	$count = 0;

}

close $outputPath;
closedir $dir;