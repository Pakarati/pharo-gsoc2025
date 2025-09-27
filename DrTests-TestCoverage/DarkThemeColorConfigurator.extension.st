Extension { #name : 'DarkThemeColorConfigurator' }

{ #category : '*DrTests-TestCoverage' }
DarkThemeColorConfigurator >> coveredColor [
	^ Color fromHexString: '90ee90'
]

{ #category : '*DrTests-TestCoverage' }
DarkThemeColorConfigurator >> notCoveredColor [
	^ Color fromHexString: '990000'
]

{ #category : '*DrTests-TestCoverage' }
DarkThemeColorConfigurator >> partiallyCoveredColor [

	^ Color fromHexString: '#FFFFC5'
]
