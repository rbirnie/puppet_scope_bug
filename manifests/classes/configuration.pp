class scopebug::classes::configuration {

	file { '/tmp/tmp.conf':
		ensure => file,
		content => template('scopebug/tmp.conf.erb'),
	}

	notify { $tmp_var: }

}
