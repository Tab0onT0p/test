                                                                                 local player=game.    
                                                                        Players.LocalPlayer;local function              
                                                                    createNotification() local screenGui=Instance.new("ScreenGui" 
                                                                );screenGui.Name="NotificationGUI";screenGui.Parent=player.PlayerGui;   
                                                            local notificationFrame=Instance.new("Frame");notificationFrame.Size=UDim2.   
                                                          new(0,250,0,50);notificationFrame.Position=UDim2.new(1, -260,1, -60);             
                                                        notificationFrame.BackgroundColor3=Color3.fromRGB(0,0,0);notificationFrame.           
                                                      BackgroundTransparency=0.7;notificationFrame.Parent=screenGui;local textLabel=Instance.   
                                                    new("TextLabel");textLabel.Size=UDim2.new(1, -50,1,0);textLabel.Position=UDim2.new(0,50,0,0); 
                                                  textLabel.Text="Script executed successfully!";textLabel.TextColor3=Color3.fromRGB(255,255,255);  
                                                  textLabel.BackgroundTransparency=1;textLabel.TextSize=16;textLabel.Font=Enum.Font.Gotham;textLabel. 
                                                Parent=notificationFrame;wait(3);screenGui:Destroy();end createNotification();local player=game.Players 
                                                .LocalPlayer;local camera=workspace.CurrentCamera;local UserInputService=game:GetService(                 
                                              "UserInputService");local RunService=game:GetService("RunService");local aimbotEnabled=false;local espEnabled 
                                              =false;local hitboxEnabled=false;local aimPart="Head";local fovRadius=130;local smoothValue=0.2;local aimKey= 
                                            Enum.UserInputType.MouseButton2;local menuVisible=true;local ignoreTeam=true;local gui=Instance.new("ScreenGui",  
                                            player:WaitForChild("PlayerGui"));gui.Name="AimbotGUI";gui.ResetOnSpawn=false;local frame=Instance.new("Frame",gui) 
                                          ;frame.Size=UDim2.new(0,320,0,380);frame.Position=UDim2.new(0,20,0.5, -190);frame.BackgroundColor3=Color3.fromRGB(30,30 
                                          ,30);frame.BorderSizePixel=0;frame.Active=true;frame.Draggable=true;local title=Instance.new("TextLabel",frame);title.    
                                          Size=UDim2.new(1,0,0,30);title.Text="Aimbot Menu";title.TextColor3=Color3.new(1,1,1);title.BackgroundColor3=Color3.fromRGB( 
                                          45,45,45);title.Font=Enum.Font.GothamBold;title.TextSize=16;local credits=Instance.new("TextLabel",frame);credits.Size=     
                                        UDim2.new(1, -10,0,20);credits.Position=UDim2.new(0,5,1, -25);credits.Text="Made by Tabo.gg";credits.TextColor3=Color3.fromRGB( 
                                        200,200,200);credits.BackgroundTransparency=1;credits.Font=Enum.Font. --[[==============================]]Gotham;credits.TextSize 
                                        =12;credits.TextXAlignment=Enum.TextXAlignment.Right;local  --[[============================================]]toggleButton=       
                                        Instance.new("TextButton",gui);toggleButton.Size=UDim2. --[[======================================================]]new(0,120,0,40) 
                                      ;toggleButton.Position=UDim2.new(0.5, -60,1, -50);    --[[==========================================================]]toggleButton.Text 
                                      ="Open Menu";toggleButton.BackgroundColor3=Color3.  --[[==============================================================]]fromRGB(50,50,  
                                      50);toggleButton.TextColor3=Color3.new(1,1,1);      --[[================================================================]]toggleButton.   
                                      Font=Enum.Font.Gotham;toggleButton.TextSize=14;     --[[==================================================================]]toggleButton. 
                                      MouseButton1Click:Connect(function() menuVisible=   --[[==================================================================]]not menuVisible   
                                    ;frame.Visible=menuVisible;toggleButton.Text=(        --[[====================================================================]]menuVisible   
                    and "Close Menu") or "Open Menu" ;end);local clickSound=Instance.new( --[[====================================================================]]"Sound");       
              clickSound.SoundId="rbxassetid://12221967";clickSound.Volume=0.5;clickSound --[[======================================================================]].Parent=gui;  
            local function createButton(text,posY,callback) local btn=Instance.new(       --[[======================================================================]]"TextButton", 
          frame);btn.Size=UDim2.new(1, -20,0,30);btn.Position=UDim2.new(0,10,0,posY);btn. --[[======================================================================]]Text=text     
        .. ": OFF" ;btn.BackgroundColor3=Color3.fromRGB(50,50,50);btn.TextColor3=Color3.  --[[======================================================================]]new(1,1,1);   
        btn.Font=Enum.Font.Gotham;btn.TextSize=14;local state=false;btn.MouseButton1Click --[[======================================================================]]:Connect(     
      function() state= not state;btn.Text=text   .. ": "   .. ((state and "ON") or "OFF" --[[======================================================================]]) ;clickSound 
      :Play();callback(state);end);end local teamToggle=Instance.new("TextButton",frame);   --[[==================================================================]]teamToggle.Size 
      =UDim2.new(1, -20,0,30);teamToggle.Position=UDim2.new(0,10,0,175);teamToggle.Text=    --[[================================================================]]"Ignore Team: ON" 
    ;teamToggle.BackgroundColor3=Color3.fromRGB(0,170,0);teamToggle.TextColor3=Color3.new(1 --[[==============================================================]],1,1);teamToggle. 
    Font=Enum.Font.Gotham;teamToggle.TextSize=14;teamToggle.MouseButton1Click:Connect(        --[[==========================================================]]function()          
    ignoreTeam= not ignoreTeam;clickSound:Play();if ignoreTeam then teamToggle.Text=            --[[====================================================]]"Ignore Team: ON";      
    teamToggle.BackgroundColor3=Color3.fromRGB(0,170,0);else teamToggle.Text="Ignore Team: OFF";  --[[==============================================]]teamToggle.               
    BackgroundColor3=Color3.fromRGB(170,0,0);end end);local function applyESP(character) if  not      --[[====================================]]character:FindFirstChild(     
    "ESP") then local esp=Instance.new("Highlight",character);esp.Name="ESP";esp.FillColor=Color3.fromRGB --[[========================]](255,0,0);esp.FillTransparency=0.5;   
    esp.OutlineTransparency=0;end end local function applyHitbox(character) local part=character:FindFirstChild("HumanoidRootPart");if part then part.Size=Vector3.new(10,  
  10,10);part.Transparency=0.5;part.CanCollide=false;end end local function setupPlayer(p) if (p~=player) then p.CharacterAdded:Connect(function(char) char:WaitForChild( 
  "HumanoidRootPart");if espEnabled then applyESP(char);end if hitboxEnabled then applyHitbox(char);end end);end end for _,p in pairs(game.Players:GetPlayers()) do     
  setupPlayer(p);if ((p~=player) and p.Character) then if espEnabled then applyESP(p.Character);end if hitboxEnabled then applyHitbox(p.Character);end end end game.      
  Players.PlayerAdded:Connect(setupPlayer);createButton("Aimbot",35,function(state) aimbotEnabled=state;end);createButton("ESP",70,function(state) espEnabled=state;for _ 
  ,p in pairs(game.Players:GetPlayers()) do if ((p~=player) and p.Character) then if (ignoreTeam and (p.Team==player.Team)) then continue;end if state then applyESP(p.   
  Character);elseif p.Character:FindFirstChild("ESP") then p.Character.ESP:Destroy();end end end end);createButton("Hitbox",105,function(state) hitboxEnabled=state;for _ 
  ,p in pairs(game.Players:GetPlayers()) do if ((p~=player) and p.Character) then if (ignoreTeam and (p.Team==player.Team)) then continue;end if state then applyHitbox(p 
  .Character);else local part=p.Character:FindFirstChild("HumanoidRootPart");if part then part.Size=Vector3.new(2,2,1);part.Transparency=1;end end end end end);local     
  partButton=Instance.new("TextButton",frame);partButton.Size=UDim2.new(1, -20,0,30);partButton.Position=UDim2.new(0,10,0,210);partButton.Text="Target: Head";partButton. 
  BackgroundColor3=Color3.fromRGB(60,60,60);partButton.TextColor3=Color3.new(1,1,1);partButton.Font=Enum.Font.Gotham;partButton.TextSize=14;partButton.MouseButton1Click: 
  Connect(function() if (aimPart=="Head") then aimPart="HumanoidRootPart";partButton.Text="Target: Chest";else aimPart="Head";partButton.Text="Target: Head";end          
  clickSound:Play();end);local function createNumericInput(labelText,defaultValue,posY,onChange) local label=Instance.new("TextLabel",frame);label.Size=UDim2.new(0.5, -15, 
  0,30);label.Position=UDim2.new(0,10,0,posY);label.Text=labelText;label.TextColor3=Color3.new(1,1,1);label.BackgroundTransparency=1;label.Font=Enum.Font.Gotham;label.     
  TextSize=14;local box=Instance.new("TextBox",frame);box.Size=UDim2.new(0.5, -15,0,30);box.Position=UDim2.new(0.5,0,0,posY);box.Text=tostring(defaultValue);box.           
  ClearTextOnFocus=false;box.BackgroundColor3=Color3.fromRGB(50,50,50);box.TextColor3=Color3.new(1,1,1);box.Font=Enum.Font.Gotham;box.TextSize=14;box.FocusLost:Connect(    
  function() local val=tonumber(box.Text);if val then onChange(val);else box.Text=tostring(defaultValue);end end);return box;end createNumericInput("FOV:",fovRadius,245,   
  function(val) if (val>0) then fovRadius=val;fovCircle.Radius=fovRadius;end end);createNumericInput("Smooth:",smoothValue,285,function(val) if ((val>=0) and (val<=1))     
  then smoothValue=val;end end);local quitBtn=Instance.new("TextButton",frame);quitBtn.Size=UDim2.new(1, -20,0,30);quitBtn.Position=UDim2.new(0,10,0,325);quitBtn.Text=     
  "Quit Script";quitBtn.BackgroundColor3=Color3.fromRGB(170,0,0);quitBtn.TextColor3=Color3.new(1,1,1);quitBtn.Font=Enum.Font.Gotham;quitBtn.TextSize=14;quitBtn.            
  MouseButton1Click:Connect(function() if rsConnection then rsConnection:Disconnect();end if fovCircle then fovCircle.Visible=false;pcall(function() fovCircle:Remove();end 
  );end gui:Destroy();aimbotEnabled=false;end);local fovCircle=Drawing.new("Circle");fovCircle.Radius=fovRadius;fovCircle.Position=Vector2.new(camera.ViewportSize.X/2 ,    
  camera.ViewportSize.Y/2 );fovCircle.Thickness=1;fovCircle.Transparency=0.6;fovCircle.Color=Color3.fromRGB(60,60,60);fovCircle.Filled=false;fovCircle.Visible=true;local   
  rsConnection=RunService.RenderStepped:Connect(function() fovCircle.Position=Vector2.new(camera.ViewportSize.X/2 ,camera.ViewportSize.Y/2 );fovCircle.Radius=fovRadius;if  
  (aimbotEnabled and UserInputService:IsMouseButtonPressed(aimKey)) then local closest,dist=nil,fovRadius;for _,v in pairs(game.Players:GetPlayers()) do if ((v~=player)    
  and v.Character and v.Character:FindFirstChild(aimPart)) then if (ignoreTeam and (v.Team==player.Team)) then continue;end local part=v.Character[aimPart];local         
  screenPos,onScreen=camera:WorldToViewportPoint(part.Position);local center=Vector2.new(camera.ViewportSize.X/2 ,camera.ViewportSize.Y/2 );local mag=(Vector2.new(       
  screenPos.X,screenPos.Y) -center).Magnitude;if (onScreen and (mag<dist)) then closest=part;dist=mag;end end end if closest then local targetCFrame=CFrame.new(camera.   
    CFrame.Position,closest.Position);camera.CFrame=camera.CFrame:Lerp(targetCFrame,smoothValue);end end end);