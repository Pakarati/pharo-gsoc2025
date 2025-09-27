Extension { #name : 'UIThemeColorConfigurator' }

{ #category : '*DrTests-TestCoverage' }
UIThemeColorConfigurator >> coveredColor [
	^ Color fromHexString: '90ee90'
]

{ #category : '*DrTests-TestCoverage' }
UIThemeColorConfigurator >> notCoveredColor [
	^ Color fromHexString: 'FF7F7F'
]

{ #category : '*DrTests-TestCoverage' }
UIThemeColorConfigurator >> partiallyCoveredColor [

	^ Color fromHexString: '#FFFFC5'
]
