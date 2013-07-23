/*
 * Main script to setup algosvers on installation
 */

def sourceFile
def targetFile

// copy VersioneBootStrap into project
sourceFile = "${pluginBasedir}/grails-app/conf/MagazzinoBootStrap.groovy"
targetFile = "${basedir}/grails-app/conf/MagazzinoBootStrap.groovy"
ant.copy(file: ("$sourceFile"), tofile:"$targetFile", overwrite:false)

print('------------')
print('Algosmag - creato MagazzinoBootStrap')
print('------------')
