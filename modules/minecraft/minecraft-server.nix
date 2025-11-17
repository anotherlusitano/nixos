# Thank you Vimjoyer!

{ pkgs, inputs, ... }: {
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    dataDir = "/var/minecraft";

    servers = {
      cafezinho = {
        enable = true;
        autoStart = false;
        package = pkgs.fabricServers.fabric-1_16_5;

        serverProperties = {
          gamemode = "survival";
          difficulty = "normal";
          simulation-distance = 8;
          max-players = 2;
          allow-flight = true;
          online-mode = false;
          allow-cheats = true;
          enable-command-block = true;
          enable-rcon = true;
          "rcon.password" = "password_that_you_will_never_know";
        };
        whitelist = { };

        # How its possible to take so long to get this working???
        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            Sodium = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/AANobbMI/versions/mc1.16.5-0.2.0/sodium-fabric-mc1.16.5-0.2.0%2Bbuild.4.jar";
              name = "sodium";
              sha512 =
                "de0ec6cc85a9b90a4a2dc43ca81db962691cb95362bde8db54115c8fadf257d97fc05267832b14f2e576af4743dfde9d79e3deeea0b46b2685085fa1e21d50ee";
            };
            Lithium = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/gvQqBUqZ/versions/mc1.16.5-0.6.6/lithium-fabric-mc1.16.5-0.6.6.jar";
              name = "lithium";
              sha512 =
                "bb2dd085a6c5fcf86ba9a63d680fb5144a5788efe9c00a9417d978722dbb84163e47bb545c310869647924dad89bcfe2bbe04cd64476b304eada914083e5c094";
            };
            IronChests = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/DWmWnJgJ/versions/IronChest-1.0%2Bfabric-1.17.1.jar/IronChest-1.0%2Bfabric-1.17.1.jar";
              name = "ironChests";
              sha512 =
                "74a5a7e5b27a03edfd71094d1f78ab6fe2bd80b7cc48c66288f23a15ebb8a6022a6905165289443e304c68d221f4858d5edbd986ae46a52a3ef2eb60558ef2cd";
            };
            IronFurnances = pkgs.fetchurl {
              url =
                "https://mediafilez.forgecdn.net/files/3181/191/%5BFABRIC%5D%20ironfurnaces-1.16-2.4.1.jar";
              name = "ironFurnances";
              sha512 =
                "70ae8c33bc5c26df3037a73d0fd64672994792ca43749cdf53b51180778b0798981390c7e25aae3d2e4504cfe40c0a1f1c244a7533c1a6e9b37608e7dc2995c7";
            };
            Gravestones = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/ssUbhMkL/versions/v1.9/gravestones-v1.9.jar";
              name = "gravestones";
              sha512 =
                "cfd5ea4b095ca4a7d796c50eb6b7550999d0c4daec82bc9400a6fe09c3f355abfa4fe321436517e36d614bed9bf29eda05e7e2e77f98282d27e93f50200bc534";
            };
            XaerosMinimap = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/1bokaNcj/versions/hztxb2W2/Xaeros_Minimap_25.2.15_Fabric_1.21.9.jar";
              name = "minimap";
              sha512 =
                "12a4a3e5756c9d9d5dc1094e495a80464b4602e0b55281d69ac4a083a533ca4dcf2fb6b6d113dcd2e705c7bf40fc9ef0f813116210974e39269fd1c7841d06d0";
            };
            ToroHealthIndicator = pkgs.fetchurl {
              url =
                "https://mediafilez.forgecdn.net/files/3408/172/torohealth-1.16.5-fabric-6.jar";
              name = "architecturyAPI";
              sha512 =
                "9d72c065dc8770223d6f230905820f7445b228136b318a52e94a4e864f4965badabc4c6ba53c004f8485707b3870746f57213817dc55c831a586fb20b823e424";
            };
            REI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/nfn13YXA/versions/5.12.385%2Bfabric/RoughlyEnoughItems-5.12.385.jar";
              name = "roughlyEnoughItems";
              sha512 =
                "a76e2e5bb7bd44596e0d3ad2204128ce2a1b3c78e20a0790c47e506fa4e4920619644ce60408a46e8887e27c41fad959aad7d4f5f0ad82c89d515695f7c79b0d";
            };
            ArchitecturyAPI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/lhGA9TYQ/versions/ScYnvqdx/architectury-1.32.68.jar";
              name = "architecturyAPI";
              sha512 =
                "8458c2c184cd6f027f4e8d8ec2bb706cedac0fd9ae7d7dfc0add9bc9220caa260fbf6006b5e1e618340e239bcad493aed1b2623833d21d9ce4e4a67307b8fe78";
            };
            ClothConfigAPI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/9s6osm5g/versions/xMTUxQCV/cloth-config-4.17.101-fabric.jar";
              name = "architecturyAPI";
              sha512 =
                "fdfb4000999e1b443a8770377b5004b536d685c6e9be7f68428f2666d8f4b3606aaf0218fb292c1de25816fc6e9bb8b548f47fdae341e5adee525ada4dfa2ab8";
            };
          });
        };
      };
    };
  };
}
