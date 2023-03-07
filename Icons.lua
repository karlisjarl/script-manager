-- variables
local object_icons = {
	-- 3d interfaces
	['ClickDetector'] = 'rbxassetid://11271237965',
	['Decal'] = 'rbxassetid://11271246740',
	['Dialog'] = 'rbxassetid://11271232459',
	['DialogChoice'] = 'rbxassetid://11271232175',
	['SurfaceAppearance'] = 'rbxassetid://11271246015',
	['Texture'] = 'rbxassetid://11271246015',

	-- adornments
	['ArcHandles'] = 'rbxassetid://11271234082',
	['BoxHandleAdornment'] = 'rbxassetid://11271220118',
	['ConeHandleAdornment'] = 'rbxassetid://11271220391',
	['CylinderHandleAdornment'] = 'rbxassetid://11271220696',
	['Handles'] = 'rbxassetid://11271235066',
	['ImageHandleAdornment'] = 'rbxassetid://11271220881',
	['LineHandleAdornment'] = 'rbxassetid://11271221149',
	['SelectionBox'] = 'rbxassetid://11271234667',
	['SelectionSphere'] = 'rbxassetid://11271234667',
	['SphereHandleAdornment'] = 'rbxassetid://11271219879',
	['SurfaceSelection'] = 'rbxassetid://11271234348',

	-- animations
	['Animation'] = 'rbxassetid://11271233058',
	['AnimationController'] = 'rbxassetid://11271233058',
	['Animator'] = 'rbxassetid://11271233058',
	['Bone'] = 'rbxassetid://11271219383',
	['Motor6D'] = 'rbxassetid://11271221431',

	-- avatar 
	['Accessory'] = 'rbxassetid://11271240172',
	['ForceField'] = 'rbxassetid://11271238857',
	['Humanoid'] = 'rbxassetid://11271246309',
	['Pants'] = 'rbxassetid://11271237110',
	['Shirt'] = 'rbxassetid://11271237310',
	['ShirtGraphic'] = 'rbxassetid://11271238276',
	['BodyColors'] = 'rbxassetid://11271248563',

	-- constraints
	['AlignOrientation'] = 'rbxassetid://11271223368',
	['AlignPosition'] = 'rbxassetid://11271223644',
	['AngularVelocity'] = 'rbxassetid://11271222476',
	['Attachment'] = 'rbxassetid://11271227781',
	['BallSocketConstraint'] = 'rbxassetid://11271226837',
	['CylindricalConstraint'] = 'rbxassetid://11271224546',
	['HingeConstraint'] = 'rbxassetid://11271226608',
	['LineForce'] = 'rbxassetid://11271223048',
	['NoCollisionConstraint'] = 'rbxassetid://11271221851',
	['PrismaticConstraint'] = 'rbxassetid://11271226396',
	['RodConstraint'] = 'rbxassetid://11271225617',
	['RopeConstraint'] = 'rbxassetid://11271225795',
	['SprintConstraint'] = 'rbxassetid://11271225384',
	['Torque'] = 'rbxassetid://11271222476',
	['VectorFoce'] = 'rbxassetid://11271222728',
	['WeldConstraint'] = 'rbxassetid://11271224760',

	-- effects
	['Beam'] = 'rbxassetid://11271224348',
	['Explosion'] = 'rbxassetid://11271239043',
	['Fire'] = 'rbxassetid://11271232802',
	['ParticleEmitter'] = 'rbxassetid://11271227987',
	['Smoke'] = 'rbxassetid://11271233298',
	['Sparkles'] = 'rbxassetid://11271237670',
	['Trail'] = 'rbxassetid://11271224967',

	-- enviornment
	['Atmosphere'] = 'rbxassetid://11271241184',
	['Clouds'] = 'rbxassetid://11271241184',
	['Sky'] = 'rbxassetid://11271241184',

	-- gui
	['BilboardGui'] = 'rbxassetid://11271231974',
	['CanvasGroup'] = 'rbxassetid://11271236221',
	['Frame'] = 'rbxassetid://11271236221',
	['ImageButton'] = 'rbxassetid://11271235348',
	['ImageLabel'] = 'rbxassetid://11271236014',
	['ScreenGui'] = 'rbxassetid://11271236475',
	['ScrollingFrame'] = 'rbxassetid://11271236221',
	['SurfaceGui'] = 'rbxassetid://11271231974',
	['TextBox'] = 'rbxassetid://11271235669',
	['TextButton'] = 'rbxassetid://11271235669',
	['TextLabel'] = 'rbxassetid://11271235834',
	['UIAspectRatioConstraint'] = 'rbxassetid://11271241721',
	['UICorner'] = 'rbxassetid://11271241721',
	['UIGradient'] = 'rbxassetid://11271241721',
	['UIGridLayout'] = 'rbxassetid://11271241721',
	['UIListLayout'] = 'rbxassetid://11271241721',
	['UIPadding'] = 'rbxassetid://11271241721',
	['UIPageLayout'] = 'rbxassetid://11271241721',
	['UIScale'] = 'rbxassetid://11271241721',
	['UISizeConstraint'] = 'rbxassetid://11271241721',
	['UIStroke'] = 'rbxassetid://11271241721',
	['UITableLayout'] = 'rbxassetid://11271241721',
	['UITextSizeConstraint'] = 'rbxassetid://11271241721',
	['VideoFrame'] = 'rbxassetid://11271218272',
	['ViewportFrame'] = 'rbxassetid://11271235348',

	-- interaction
	['Seat'] = 'rbxassetid://11271239290',
	['SpawnLocation'] = 'rbxassetid://11271227376',
	['Team'] = 'rbxassetid://11271242343',
	['Tool'] = 'rbxassetid://11271244229',
	['VehicleSeat'] = 'rbxassetid://11271239290',

	-- lights
	['PointLight'] = 'rbxassetid://11271245156',
	['SpotLight'] = 'rbxassetid://11271245156',
	['SurfaceLight'] = 'rbxassetid://11271245156',

	-- meshes
	['BlockMesh'] = 'rbxassetid://11271246571',
	['CharacterMesh'] = 'rbxassetid://11271233058',
	['SpecialMesh'] = 'rbxassetid://11271246571',

	-- parts
	['CornerWedgePart'] = 'rbxassetid://11271248307',
	['MeshPart'] = 'rbxassetid://11271248307',
	['Part'] = 'rbxassetid://11271248307',
	['TrussPart'] = 'rbxassetid://11271248307',
	['WedgePart'] = 'rbxassetid://11271248307',

	-- post processing effects
	['BloomEffect'] = 'rbxassetid://11271227376',
	['BlurEffect'] = 'rbxassetid://11271227376',
	['ColorCorrectionEffect'] = 'rbxassetid://11271227376',
	['DepthOfFieldEffect'] = 'rbxassetid://11271227376',
	['SunRaysEffect'] = 'rbxassetid://11271227376',

	-- scripting
	['BindableEvent'] = 'rbxassetid://112712312120',
	['BindableFunction'] = 'rbxassetid://11271231540',
	['LocalScript'] = 'rbxassetid://11271243964',
	['ModuleScript'] = 'rbxassetid://11271228914',
	['RemoteEvent'] = 'rbxassetid://11271229078',
	['RemoteFunction'] = 'rbxassetid://11271229217',
	['Script'] = 'rbxassetid://11271246966',

	-- sounds
	['Sound'] = 'rbxassetid://11271245701',
	['SoundGroup'] = 'rbxassetid://11271227068',

	-- uncategorized
	['Camera'] = 'rbxassetid://11271247259',
	['Configuration'] = 'rbxassetid://11271233548',
	['Folder'] = 'rbxassetid://11271228683',
	['HumanoidDescription'] = 'rbxassetid://11271222178',
	['Model'] = 'rbxassetid://11271248136',
	['Weld'] = 'rbxassetid://11271239533',

	-- values
	['BoolValue'] = 'rbxassetid://11271247607',
	['BrickColorValue'] = 'rbxassetid://11271247607',
	['CFrameValue'] = 'rbxassetid://11271247607',
	['Color3Value'] = 'rbxassetid://11271247607',
	['IntValue'] = 'rbxassetid://11271247607',
	['NumberValue'] = 'rbxassetid://11271247607',
	['ObjectValue'] = 'rbxassetid://11271247607',
	['RayValue'] = 'rbxassetid://11271247607',
	['StringValue'] = 'rbxassetid://11271247607',
	['Vector3Value'] = 'rbxassetid://11271247607',

	-- world
	['Terrain'] = 'rbxassetid://11271231780'
}
return object_icons
