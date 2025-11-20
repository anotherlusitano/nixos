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
        package = pkgs.fabricServers.fabric-1_16_5.override {
          loaderVersion = "0.16.10";
        };

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
            FabricAPI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/P7dR8mSH/versions/0.42.0%2B1.16/fabric-api-0.42.0%2B1.16.jar";
              sha512 =
                "20defa796ea605fbad3285a7216c3bf8ac88bffbd0eee997c77e49dd6fbcf86631ef4ab75ab571d3d402181d1aa5c2bd945985a5119b411ef014b31c4ee1a5fb";
            };
            ArchitecturyAPI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/lhGA9TYQ/versions/ScYnvqdx/architectury-1.32.68.jar";
              sha512 =
                "8458c2c184cd6f027f4e8d8ec2bb706cedac0fd9ae7d7dfc0add9bc9220caa260fbf6006b5e1e618340e239bcad493aed1b2623833d21d9ce4e4a67307b8fe78";
            };
            ClothConfigAPI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/9s6osm5g/versions/xMTUxQCV/cloth-config-4.17.101-fabric.jar";
              sha512 =
                "fdfb4000999e1b443a8770377b5004b536d685c6e9be7f68428f2666d8f4b3606aaf0218fb292c1de25816fc6e9bb8b548f47fdae341e5adee525ada4dfa2ab8";
            };
            CoroUtil = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/rLLJ1OZM/versions/lJq1RQnC/coroutil-fabric-1.16.5-1.3.6.jar";
              sha512 =
                "8caff63bc9b5de120c4b01bbc5032a3db350145b49ad25baa227b6ce5878d609094847d4253b9bbb900643455aad8dc9dd872f3f807402efd17e25435acf9ba8";
            };
            GeckoLib = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/8BmcQJ2H/versions/Z8ZwOmeO/geckolib-fabric-1.16.5-3.0.107.jar";
              sha512 =
                "55d35b0345eb4bec4bd4843490b14989edeb91969453afe29c52278c72df307cfa911e7b3b5bfa71c33420d7f5aa221e32a38ffb09078451d9c1f08c9ef6899f";
            };
            Patchouli = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/nU0bVIaL/versions/1.16.4-53-fabric/Patchouli-1.16.4-53-FABRIC.jar";
              sha512 =
                "f14a786336d7dd68fc9abadd696bac9badc4a56f5270ef161f09ba8453815cc7e5ecd4b94bf0df07504c55d4678d4713656dc4c1b83c0122501464ab01e6d478";
            };
            Sodium = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/AANobbMI/versions/mc1.16.5-0.2.0/sodium-fabric-mc1.16.5-0.2.0%2Bbuild.4.jar";
              sha512 =
                "de0ec6cc85a9b90a4a2dc43ca81db962691cb95362bde8db54115c8fadf257d97fc05267832b14f2e576af4743dfde9d79e3deeea0b46b2685085fa1e21d50ee";
            };
            Lithium = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/gvQqBUqZ/versions/mc1.16.5-0.6.6/lithium-fabric-mc1.16.5-0.6.6.jar";
              sha512 =
                "bb2dd085a6c5fcf86ba9a63d680fb5144a5788efe9c00a9417d978722dbb84163e47bb545c310869647924dad89bcfe2bbe04cd64476b304eada914083e5c094";
            };
            XaerosMinimap = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/1bokaNcj/versions/dNvdBlnN/Xaeros_Minimap_25.2.10_Fabric_1.16.5.jar";
              sha512 =
                "693aab5b69a972d05f05cb9fe57ff38619e5c7c1db7a27e69d68bf493146e82e59df3be3c51af911e622e312f9eafe81233060649c23dd4edb5ea5b183c5d399";
            };
            ToroHealthIndicator = pkgs.fetchurl {
              url =
                "https://mediafilez.forgecdn.net/files/3408/172/torohealth-1.16.5-fabric-6.jar";
              sha512 =
                "9d72c065dc8770223d6f230905820f7445b228136b318a52e94a4e864f4965badabc4c6ba53c004f8485707b3870746f57213817dc55c831a586fb20b823e424";
            };
            REI = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/nfn13YXA/versions/5.12.385%2Bfabric/RoughlyEnoughItems-5.12.385.jar";
              sha512 =
                "a76e2e5bb7bd44596e0d3ad2204128ce2a1b3c78e20a0790c47e506fa4e4920619644ce60408a46e8887e27c41fad959aad7d4f5f0ad82c89d515695f7c79b0d";
            };
            WhatAreTheyDoing = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/AtB5mHky/versions/VTlIWZCY/watut-fabric-1.16.5-1.0.14.jar";
              sha512 =
                "7046815d5241995a958851f1498be89c9967fc77b43d47e3fb729a47fe644528d8fe3fe8e5aaa114a886975f6f0c9bb4362bbe94a3a0c9767e1f837e415cbb41";
            };
            TheRealGravestones = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/HnD1GX6e/versions/1.0.9/youre-in-grave-danger-1.0.9.jar";
              sha512 =
                "35d9bf6e09d9f9b9d7ccb88ac490f29beed3035677cade8988274c7bb8c9ef25ed429e8ba6eaadd29cfd2ff7c5253ca1a495a11cd7e114587d2a256aa9c9def9";
            };
            Emojis = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/q7vRRpxU/versions/q3ICvlUh/emoji-type-2.0.1%2B1.16.5.jar";
              sha512 =
                "aab6036a7f0e37c4fda36e18766151dd3f99488a8acf13df67d4313527dc699bbaf1d166250205ea861f65a8bdaff953aad87b841b39f5af4a701974dd2eec85";
            };
            MythicMounts = pkgs.fetchurl {
              url =
                "https://cdn.modrinth.com/data/xP7vOoRA/versions/wam2BHZl/mythic-mounts-1.16.5-7.1.jar";
              sha512 =
                "13a5e5b4fc4813ff6a2862948fb5017a11bc465e63f41289dab3c5e1171b709a1ee92fce36889dee8f935a21e007759d0616aacb79a05882aa3baad62c7d2650";
            };
          });
        };
      };
    };
  };
}
