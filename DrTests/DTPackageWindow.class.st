Class {
	#name : 'DTPackageWindow',
	#superclass : 'SpRequestDialog',
	#instVars : [
		'packagesList',
		'itemsList'
	],
	#category : 'DrTests',
	#package : 'DrTests'
}

{ #category : 'layout' }
DTPackageWindow >> defaultLayout [ 
	^ SpBoxLayout newTopToBottom
        spacing: 5;
        add: (SpPanedLayout newLeftToRight
            add: packagesList;
            add: itemsList;
            yourself)
        expand: true;
        yourself
]

{ #category : 'accessing' }
DTPackageWindow >> itemsList: aListPresenter [  

    itemsList := aListPresenter
]

{ #category : 'accessing' }
DTPackageWindow >> packagesList: aListPresenter [

    packagesList := aListPresenter
	
]
