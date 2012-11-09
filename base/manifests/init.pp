# stage { 'pre-flight': before => Stage[main] }
# class { 'base': stage => 'pre-flight' }

class base {

  include base::time
  include base::packages

}
