package URI::exasol;
use base 'URI::_odbc';
our $VERSION = '0.18';

sub default_port { 8563 }

sub _dbi_param_map {
    my $self = shift;
    my $host = $self->host;
    my $port = $self->_port;

    # Just return the DSN if no host or port.
    return [ DSN => scalar $self->dbname ] unless $host || $port;

    # Fetch the driver from the query params.
    require URI::QueryParam;
    return (
        [ EXAHOST   => $host                        ],
        [ EXAPORT   => $port || $self->default_port ],
    );
}

1;
