# This is the site level storybook

# override library functions and add your site level functions here


########################### elias ##########################

function(greycheck)
if(urlin, banned) return setblock
if(sitein, banned) return setblock
if(urlin, grey) return setgrey

function(exceptioncheck)
if(urlin, banned) return setblock
if(sitein, banned) return setblock
if(urlin, exception) return setexception
if(refererin,refererexception) return setexception
if(headerin, exceptionheader) return setexception
if(useragentin, exceptionuseragent) return setexception
ifnot(urlin,embededreferer) return false
if(embeddedin,refererexception) return setexception

function(sslexceptioncheck)
if(urlin, banned) return setblock
if(sitein, banned) return setblock
if(sitein, exception) return setexception
if(headerin, exceptionheader) return setexception
if(useragentin, exceptionuseragent) return setexception
if(true) return false

#########################################

#Examples:-

# General:-

# If you do not use local files then uncomment the following lines:-
#function(localcheckrequest)
#function(localsslrequestcheck)
#function(localgreycheck)
#function(localbannedcheck)
#function(localexceptioncheck)
#function(localsslcheckrequest)

# To disable checks on embedded urls then uncomment:-
#function(embeddedcheck)

# If you have bypass enabled then comment out next line:-
function(checknobypasslists)

# If you have av scanning enabled then comment out next 2 lines:-
function(checknoscanlists)
function(checknoscantypes)

# If you only want exception extensions/mime filetypes to be allowed
# then uncomment the following 4 lines # elias I allowed next 4 lines to allow all css
#function(checkfiletype)
#if(mimein, exceptionmime) return false
#if(extensionin, exceptionextension) return false
#if(true) return setblock


# For ICAP mode:-

# If you are using squid bump for https interception uncomment
# next 2 lines
#function(icapsquidbump)
#if(true) return true
