{ pkgs, ... }:
{
  services.prometheus = {
     enable = true;

     exporters = {
       node.enable = true;
     };

     scrapeConfigs = [
       {
	  job_name = "os_stuff";
	  static_configs = [
	     { 
	        targets = [ "localhost:9100" ]; 
	     }
          ];
       }
     ];

     globalConfig.scrape_interval = "5s";
  };
}
