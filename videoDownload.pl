#!/usr/bin/perl
#use strict;
use warnings;
use WWW::Youtube::Download;
use File::Copy;
my $outputPath = "/Users/arsha_000/Desktop/YouTube";
mkdir $outputPath;

die "Usage: $0 <Youtube video URL> <Path to output directory> \n" if not @ARGV;

my $video = WWW::YouTube::Download->new;
my $video_id = $ARGV[0];
my $outputFile = $ARGV[1];
my $originalFile;

my $title = $video->get_title($video_id);
my $suffix = $video->get_suffix($video_id);

$video->download($video_id, {
	filename => "$title.{suffix}",
 	});

$originalFile="$title.$suffix";
print $originalFile;
move($originalFile,$outputFile) or die "Move failed: $!";