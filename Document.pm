# -*- Perl -*-
# Document.pm
# This module allows for the easy construction of multi-page textual
# reports with the PostScript::TextBlock module.
#
# You may distribute this under the same terms as Perl
# itself.
#


package PostScript::Document;
use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter AutoLoader);
@EXPORT = qw();
$VERSION = '0.03';

use PostScript::TextBlock;

# Some standard paper sizes
#
my @papers = qw( Letter Legal Ledger Tabloid A0 A1 A2 A3 A4 A5 A6 A7 A8
                 A9 B0 B1 B2 B3 B4 B5 B6 B7 B8 B9 Envelope10 EnvelopeC5 
                 EnvelopeDL Folio Executive );

# Dimensions of standard papers
#
my %width = (  Letter => 612,     Legal => 612,
               Ledger => 1224,    Tabloid => 792,
               A0 => 2384,        A1 => 1684,
               A2 => 1191,        A3 => 842,
               A4 => 595,         A5 => 420,
               A6 => 297,         A7 => 210,
               A8 => 148,         A9 => 105,
               B0 => 2920,        B1 => 2064,
               B2 => 1460,        B3 => 1032,
               B4 => 729,         B5 => 516,
               B6 => 363,         B7 => 258,
               B8 => 181,         B9 => 127, 
               B10 => 91,         Envelope10 => 297,
               EnvelopeC5 => 461, EnvelopeDL => 312,
               Folio => 595,      Executive => 522
            );
my %height = ( Letter => 792,  Legal => 1008,
               Ledger => 792,  Tabloid => 1224,
               A0 => 3370,        A1 => 2384,
               A2 => 1684,        A3 => 1191,
               A4 => 842,         A5 => 595,
               A6 => 420,         A7 => 297,
               A8 => 210,         A9 => 148,
               B0 => 4127,        B1 => 2920,
               B2 => 2064,        B3 => 1460,
               B4 => 1032,        B5 => 729,
               B6 => 516,         B7 => 363,
               B8 => 258,         B9 => 181, 
               B10 => 127,        Envelope10 => 684,
               EnvelopeC5 => 648, EnvelopeDL => 624,
               Folio => 935,      Executive => 756
    );

# Valid attribute names
# 
my @paramnames = qw( paper width height
                     rmargin lmargin tmargin bmargin );

# Default values of document attributes
#
my %defaults = ( 
                paper   => 'Letter',
                width   => $width{'Letter'},
                height  => $height{'Letter'},
                rmargin => 37,        # .5 inches
                lmargin => 37,
                tmargin => 37,
                bmargin => 37,
               );

sub new {
    # The constructor method
    #
    my $class = shift;
    my %params = @_;
   
    # Allow a user to specify only a paper size and set the 
    # width and height accordingly
    #
    if (defined ($params{'paper'})) {
        $params{'width'} = $width{$params{'paper'}} 
	    if defined($width{$params{'paper'}});   
        $params{'height'} = $height{$params{'paper'}} 
	    if defined($height{$params{'paper'}});  
    }
    
    # Use the default value if a value is not provided
    #
    foreach (@paramnames) {
        $params{$_} = $defaults{$_} unless (defined($params{$_}));
    }
    
    my $self = { content => new PostScript::TextBlock,
                 header  => new PostScript::TextBlock,
                 footer  => new PostScript::TextBlock,
                 %params };
     
    bless($self,$class);
    return $self;
}

sub addText {
    # Add text to the document
    #
    my $self = shift;
    my %params = @_;
 
    # Call the PostScript::TextBlock::addText method
    #
    $self->{'content'}->addText(%params);
    
}


sub addHeader {
    # Add a textual header to the document
    #
    my $self = shift;
    my %params = @_;
     
    $self->{'header'}->addText(%params);
}

sub addFooter {
    # Add a textual footer to the document
    #
    my $self = shift;
    my %params = @_;
     
    $self->{'footer'}->addText(%params);
}

sub printHeader {
    # Create the PostScript code to generate the header
    #
}

sub printFooter {
    # Create the PostScript code to generate the footer 

# Do a search for some meta character that specifies a page number 
# replace it with the page number...
}


sub Write {
    # The Write() method is called without parameters. It 
    # returns a string containing the complete PostScript code
    # for the Document.
    #
    my $self = shift;
    my $pages = 1;
   
    # Must follow the Document Structuring Conventions
    #
    my $returnval = "%%Do all the header and prolog stuff...\n";


    my $w = $self->{'width'} - $self->{'rmargin'} - $self->{'lmargin'};
    my $h = $self->{'height'} - $self->{'tmargin'} - $self->{'bmargin'};
    my $x = $self->{'lmargin'};
    my $y = $h + $self->{'bmargin'};

    $returnval .= "%%Page: 1\n";
    
    my ($code, $remainder) = $self->{content}->Write($w, $h, $x, $y);
    $returnval .= $code;
    $returnval .= "showpage\n";
    
    # Print the rest of the pages, if any
    #
    while ($remainder->numElements) {
        $pages++;
        $returnval .= "%%Page:$pages\n";
        ($code, $remainder) = $remainder->Write($w, $h, $x, $y);
        $returnval .= $code;
        $returnval .= "showpage\n";
    }

    return $returnval;

}


1;


__END__

=head1 NAME

PostScript::Document

=head1 SYNOPSIS

Fix me.

=head1 DESCRIPTION

Fix me.

=head1 AUTHOR

Shawn Wallace (shawn@as220.org)

=head1 SEE ALSO

PostScript::TextBlock, PostScript::Element

=cut
    
