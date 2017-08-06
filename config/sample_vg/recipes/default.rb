execute "Configuring PHP installation" do
    command "sudo apt-get install -y php5-gd php5-mysql"

    notifies :reload, 'service[apache2]', :delayed
end

template "/etc/apache2/sites-enabled/test.vhost.conf" do
    source "test.vhost.conf.erb"
    mode '0700'
    owner 'root'
    group node['apache']['root_group']
    action :create
    notifies :reload, 'service[apache2]', :delayed
end

execute "Init DB" do
    command "sudo service mysql start"

    # Grant access to mysql from host computer
    mysql_cmd = %Q(mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;")
    command mysql_cmd

    # Restore original database
    cwd "/vagrant/site-cookbooks/appinit/db"
    command "mysql -uroot < test_dev.sql"
end

# execute "Setup cron job" do
#     # Install crontab
#     cwd "/vagrant/site-cookbooks/appinit/crontab"
#     command "sudo crontab -u vagrant site-crontab"
# end

execute "Setup timezone" do
    command "sudo timedatectl set-timezone Asia/Tokyo"
end

# Install mail server
execute "Install ssmtp to send mail" do
    command "sudo apt-get -y install ssmtp mailutils"
end

bash "installing_compass" do
    code <<-EOH
    sudo apt-get install -y ruby-dev
    gem install compass
    EOH
end

bash "installing_grunt" do
    code "sudo npm install -g grunt-cli"
end

bash "update_npm" do
    code "sudo npm -g install npm@latest-2"
end

bash "installing_node_packages" do
    cwd "/vagrant"
    code "npm install --no-bin-links"
end

template "/etc/ssmtp/ssmtp.conf" do
    source "test.ssmtp.conf.erb"
    owner 'root'
    group 'root'
    mode '0644'
    notifies :reload, 'service[apache2]', :delayed
end

#Disable send mail on crontab
template "/etc/cron.d/php5" do
    source "test.cron-php.erb"
    owner 'root'
    group 'root'
end

template "/etc/php5/apache2/php.ini" do
    source "test.php.ini.erb"
    owner 'root'
    group 'root'
    mode '0644'
    notifies :reload, 'service[apache2]', :delayed
end
