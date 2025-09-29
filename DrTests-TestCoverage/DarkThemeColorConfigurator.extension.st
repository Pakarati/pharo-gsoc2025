Extension { #name : 'DarkThemeColorConfigurator' }

{ #category : '*DrTests-TestCoverage' }
DarkThemeColorConfigurator >> coveredColor [
	^ Color fromHexString: '#003300'
]

{ #category : '*DrTests-TestCoverage' }
DarkThemeColorConfigurator >> notCoveredColor [
	^ Color fromHexString: '#65000b'
]

{ #category : '*DrTests-TestCoverage' }
DarkThemeColorConfigurator >> partiallyCoveredColor [

	^ Color fromHexString: '#8B6914'
]
