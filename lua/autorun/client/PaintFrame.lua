--[[---------------------------------------------------------
Name: Skincreator
-----------------------------------------------------------]]

 nlayer = {}

 function NewTemplate()

local select = "basic"
local test = {}
 test["basic"] = { w = 750, h = 500, backg = Color( 255, 255, 255, 0) }


 local frame = vgui.Create("GMenu")
frame:SetPos(542,442)
frame:SetSize(300,177) 
frame:SetDragable( false )
 frame:MakePopup()


  local width = vgui.Create("DTextEntry",frame)
						 width:SetPos(0.19*frame:GetWide() ,0.49717514124294*frame:GetTall())
						 width:SetSize(0.32666666666667*frame:GetWide(),0.14124293785311*frame:GetTall())
						 width:SetText( test[select].w )

 local height = vgui.Create("DTextEntry",frame)
						 height:SetPos(0.62666666666667*frame:GetWide() ,0.49717514124294*frame:GetTall())
						 height:SetSize(0.32666666666667*frame:GetWide(),0.14124293785311*frame:GetTall())
						 height:SetText( test[select].h )

 local e = vgui.Create("DComboBox",frame)
						 e:SetPos(0.19*frame:GetWide() ,0.33898305084746*frame:GetTall())
						 e:SetSize(0.76333333333333*frame:GetWide(),0.14124293785311*frame:GetTall())
						 local settings = string.Explode( "\n", file.Read("ride/newmenu_settings.txt", "DATA") )
							for k,v in ipairs( settings ) do
								if( v == "" ) then

								else

								local t =  util.JSONToTable( v )
								test[t.name] = { w = t.w, h = t.h, backg = t.backg }
								e:AddChoice( t.name )
								end
							end 
							e.OnSelect = function( panel, index, value )
							select = value
							 height:SetText( test[select].h )
							 width:SetText( test[select].w )
							end

 local e = vgui.Create("RLabel",frame)
						 e:SetPos(0.046666666666667*frame:GetWide() ,0.18079096045198*frame:GetTall())
						 e:SetSize(0.16666666666667*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetText("Name:")
				
 local e = vgui.Create("RLabel",frame)
						 e:SetPos(0.046666666666667*frame:GetWide() ,0.33898305084746*frame:GetTall())
						 e:SetSize(0.19*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetText("Settings:")

 local Name = vgui.Create("DTextEntry",frame)
						 Name:SetPos(0.19*frame:GetWide() ,0.18079096045198*frame:GetTall())
						 Name:SetSize(0.76333333333333*frame:GetWide(),0.14124293785311*frame:GetTall())
						 Name:SetText( "Unknown" )
				
 local e = vgui.Create("RLabel",frame)
						 e:SetPos(0.046666666666667*frame:GetWide() ,0.49717514124294*frame:GetTall())
						 e:SetSize(0.15*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetText("Width:")

 local e = vgui.Create("RLabel",frame)
						 e:SetPos(0.53*frame:GetWide() ,0.49152542372881*frame:GetTall())
						 e:SetSize(0.11*frame:GetWide(),0.14689265536723*frame:GetTall())
						 e:SetText("Tall:")


 local e = vgui.Create("RLabel",frame)
						 e:SetPos(0.046666666666667*frame:GetWide() ,0.64971751412429*frame:GetTall())
						 e:SetSize(0.15*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetText("Backg.")
						
 local e = vgui.Create("DComboBox",frame)
						 e:SetPos(0.19*frame:GetWide() ,0.64971751412429*frame:GetTall())
						 e:SetSize(0.76333333333333*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetValue( tostring(test[select].backg) )
 local e = vgui.Create("RButton",frame)
						 e:SetPos(0.52*frame:GetWide() ,0.80790960451977*frame:GetTall())
						 e:SetSize(0.43333333333333*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetText("save settings")
						 e.DoClick = function()

							local save = vgui.Create("GMenu")
							save:SetPos(542,442)
							save:SetSize(400,60) 
							save:SetTitle( "Save settings")
							save:SetDragable( false )
							save:MakePopup()
						 local files = vgui.Create("DTextEntry",save)
						 files:SetPos(2,32)
						 files:SetSize(save:GetWide()-4,26)
						 files:SetText( "" )
						 function files:OnEnter()
						 if( string.len(self:GetText()) < 6 ) then
							LocalPlayer():ChatPrint( "[DermaDesigner]: Sorry the name length must equal 6 or greater than 6, try again")
						else
							local t = { backg = Color(0,0,0,0) , name = self:GetText() , h = height:GetText() , w = width:GetText() }
							local j = util.TableToJSON( t )
							file.Append( "ride/newmenu_settings.txt", "\n" .. j )
							self:GetParent():Remove()
						end
						 end

						 end
 local e = vgui.Create("RButton",frame)
						 e:SetPos(0.046666666666667*frame:GetWide() ,0.80790960451977*frame:GetTall())
						 e:SetSize(0.43333333333333*frame:GetWide(),0.14124293785311*frame:GetTall())
						 e:SetText("create")
						  e.DoClick = function()

						PaintFrame( tonumber(width:GetText()), tonumber(height:GetText()) , Name:GetText() )	
						frame:Remove()

						 end	


 end

  function PaintFrame( w, h, name )

	local frame = vgui.Create("GMenu")
	frame:SetTitle( name )
	frame:SetPos(ScrW() * 0.11315789473684210526315789473684,ScrH() * 0.24)
	frame:SetDragable( false )
	frame:SetSize(ScrW() * 0.50526315789473684210526315789474,ScrH() * 0.5) 
	frame:MakePopup()

	local bounds = vgui.Create("DPanel",frame)
	bounds:SetPos(0.041666666666667*frame:GetWide(),30)
	bounds:SetSize(frame:GetWide()-bounds.x,frame:GetTall()-31)
	function bounds:Paint(w,h)

	end

    designer = vgui.Create("DDDesigner",frame)
    designer:SetPos(frame:GetWide() * 0.5 - w * 0.5 ,frame:GetTall() * 0.5 - h * 0.5 )
	designer:SetSize( w - (0.003125*frame:GetWide()) , h )
	function designer:OverWrite()

		if( self.x < bounds.x ) then

			self.x = bounds.x 

		end

		if( self.y < bounds.y ) then

			self.y = bounds.y

		end

		if( self:GetWide() > bounds:GetWide() ) then
			
			self:SetWide( bounds:GetWide() )

		end

		if( self:GetTall() > bounds:GetTall() ) then

			self:SetTall( bounds:GetTall() )

		end

	end
	local e = vgui.Create("DDSideBoard",frame)
	e:SetPos(0 ,30)
	e:SetSize(0.041666666666667*frame:GetWide(),frame:GetTall()-30)
	e:AddButton("DD/icons/Button.png",function() designer:SetModus("mouse") end )
	e:AddButton("DD/gui/frect.png",function() designer:SetModus("rect") end )
	e:AddButton("DD/gui/poly.png",function() designer:SetModus("poly") end )
	e:AddButton("DD/gui/poly.png",function() designer:SetModus("4poly") end )
	e:AddButton("DD/gui/orect.png",function() designer:SetModus("orect") end )
	e:AddButton("DD/gui/circle.png",function() designer:SetModus("circle") end )

	local Eframe = vgui.Create("GMenu",frame)
	Eframe:SetTitle( "Editor")
	Eframe:SetDragable( false )
	Eframe:SetPos(frame:GetWide() + frame.x + 10 ,ScrH() * 0.24)
	Eframe:SetSize(ScrW()*0.10526315789473684210526315789474,ScrH() * 0.5) 
	

	
	local EColor = vgui.Create("DColorMixer",Eframe)
	EColor:SetPos(2,Eframe:GetTall() * 0.25)
	EColor:SetSize(	Eframe:GetWide()-4,Eframe:GetTall() * 0.5 - 35)
	function EColor:ValueChanged(col)

	designer:SetDrawColor(col)
	
	end

	local EPanel = vgui.Create("DPanelList",Eframe)
	EPanel:SetPos(2,Eframe:GetTall()*0.70)
	EPanel:SetSize(	Eframe:GetWide()-4,Eframe:GetTall() * 0.3 - 2)
	EPanel:EnableVerticalScrollbar()
	local selected = {}
	
	function EPanel:Think()

		if( #self.Items < #designer.layer ) then

			Button = vgui.Create( "DDLayer" )
			Button:SetSize( EPanel:GetWide(), 60 )
			if( designer.layer[#designer.layer].typ == "4poly" or designer.layer[#designer.layer].typ == "poly" ) then
			Button:SetPreView( { typ = designer.layer[#designer.layer].typ , parent = designer, data = designer.layer[#designer.layer].poly } )
			Button:SetID( #designer.layer )
			elseif( designer.layer[#designer.layer].typ == "rect" ) then
			Button:SetPreView( { typ = designer.layer[#designer.layer].typ , parent = designer, data = { x = designer.layer[#designer.layer].x, y = designer.layer[#designer.layer].y, w = designer.layer[#designer.layer].w, h = designer.layer[#designer.layer].h } } )
			Button:SetID( #designer.layer )
			elseif( designer.layer[#designer.layer].typ == "orect" ) then
			Button:SetPreView( { typ = designer.layer[#designer.layer].typ , parent = designer, data = { x = designer.layer[#designer.layer].x, y = designer.layer[#designer.layer].y, w = designer.layer[#designer.layer].w, h = designer.layer[#designer.layer].h } } )
			Button:SetID( #designer.layer )
			elseif( designer.layer[#designer.layer].typ == "circle" ) then
			Button:SetPreView( { typ = designer.layer[#designer.layer].typ , parent = designer, data = { x = designer.layer[#designer.layer].x, y = designer.layer[#designer.layer].y, w = designer.layer[#designer.layer].w} } )
			Button:SetID( #designer.layer )
			end
			table.insert(nlayer, Button)
			EPanel:AddItem(Button)
			PrintTable( designer.layer )
		end 

		for k,v in ipairs( self.Items ) do
	
			if( v:GetSelect() ) then
				if( table.HasValue( selected, v ) ) then
				else
					if( #selected > 0 ) then
						selected[1]:SetSelect( false )
						table.Empty( selected )
					end 
					table.insert( selected, v )
				end
			end
		end
	end
	function EPanel:Paint( w, h )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h )
	end

	local save = vgui.Create("DButton",Eframe )
	save:SetPos(2,33)
	save:SetSize( Eframe:GetWide()-4, 25 )
	save:SetText("save")
	save.DoClick = function()

	local pfile = {}
	
	for k,v in ipairs( designer.layer ) do
		if( v.typ == "poly" ) then
			local line = [[ 
		surface.SetDrawColor( 225,0,0,255 )
		surface.SetTexture(-1)
		surface.DrawPoly({ { x = ]]  .. v.poly[1].x / designer:GetWide() .. " * w , y = " .. v.poly[1].y / designer:GetTall() .. " * h },{ x = " .. v.poly[2].x / designer:GetWide() .. " * w ,y = " .. v.poly[2].y / designer:GetTall() .. " * h },{x = " .. v.poly[3].x / designer:GetWide() .. " * w ,y = " .. v.poly[3].y / designer:GetTall() .. [[ * h } } )]]
		table.insert( pfile, line )
		elseif( v.typ == "4poly" ) then
			local line = [[ 
		surface.SetDrawColor( 225,0,0,255 )
		surface.SetTexture(-1)
		surface.DrawPoly({ { x = ]]  .. v.poly[1].x / designer:GetWide() .. " * w , y = " .. v.poly[1].y / designer:GetTall() .. " * h },{ x = " .. v.poly[2].x / designer:GetWide() .. " * w ,y = " .. v.poly[2].y / designer:GetTall() .. " * h },{x = " .. v.poly[3].x / designer:GetWide() .. " * w ,y = " .. v.poly[3].y / designer:GetTall() .. " * h },{ x = " .. v.poly[4].x / designer:GetWide() .. " * w , y = " .. v.poly[4].y / designer:GetTall() .. [[ * h} })]]
		table.insert( pfile, line )
		elseif( v.typ == "circle" ) then
			local line = [[ 
		surface.DrawCircle( ]] .. v.x / designer:GetWide() .. " * w," .. v.y / designer:GetTall() .. " * h," .. v.w / designer:GetTall() .. " * w , Color(" .. "255,0,0,255" ..  [[ ) )]]
		table.insert( pfile, line )
		elseif( v.typ == "rect" ) then
			local line = [[ 
		surface.SetDrawColor( 225,0,0,255 )
		surface.DrawRect( ]] .. v.x / designer:GetWide() .. " * w," .. v.y / designer:GetTall() .. " * h," .. v.w / designer:GetWide() .. " * w," .. v.h / designer:GetTall() .. [[ * h )]]
		table.insert( pfile, line )
		elseif( v.typ == "orect" ) then
			local line = [[ 
		surface.SetDrawColor( 225,0,0,255 )
		surface.DrawOutlinedRect(]] .. v.x / designer:GetWide() .. " * w ," .. v.y / designer:GetTall() .. " * h," .. v.w / designer:GetWide() .. " * w," .. v.h / designer:GetTall() .. [[ * h )]]
			table.insert( pfile, line )
		end
	end
	PrintTable( pfile )
	Msg("\n")

	if( file.Exists("ride/" .. name .. ".txt","DATA") ) then
		// overwirte question

		file.Delete("ride/" .. name .. ".txt")
	end

		for k,v in ipairs( pfile ) do
			if( file.Exists("ride/" .. name .. ".txt","DATA") ) then
				file.Write( "ride/" .. name .. ".txt", file.Read("ride/" .. name .. ".txt") .. "\n" .. v .. "" )
			else
				file.Write("ride/" .. name .. ".txt", v )

			end
		end

	local a,b = 250,25
	local temp = [[
function ]] .. name .. [[()
	local frame = vgui.Create( "DFrame" )
	frame:SetPos(500, 500 )
	frame:SetSize(500, 500)
	frame:SetTitle( "]] .. name .. [[" )
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:SetSizable( true )
	frame:ShowCloseButton( true )
	frame:MakePopup()

	local preview = vgui.Create("DPanel", frame )
	preview:SetPos(5,35)
	preview:SetSize( ]] .. a .. [[, ]] .. b .. [[)
	function preview:Paint(w,h)

	]] .. file.Read("ride/" .. name .. ".txt","DATA")  .. [[  

	end

end

	]] .. name .. [[() ]]
	RunString( temp )

	end

 end
