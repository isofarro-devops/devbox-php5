#
# XML-RPC client
#
class xmlrpc {
    # Install XML_RPC2 via pear
    exec { 'xml-rpc2':
        command => 'pear install XML_RPC2',
        user    => root,
        require => Exec['update-pear']
    }

}