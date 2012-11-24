//
//  OCSPanner.m
//  Objective-C Sound
//
//  Auto-generated from database on 11/24/12.
//  Modified by Aurelius Prochazka to add pan methods.
//
//  Copyright (c) 2012 Hear For Yourself. All rights reserved.
//
//  Implementation of Csound's pan2:
//  http://www.csounds.com/manual/html/pan2.html
//

#import "OCSPanner.h"

@interface OCSPanner () {
    OCSAudio *asig;
    OCSParameter *xp;
    OCSConstant *imode;
}
@end

@implementation OCSPanner

- (id)initWithAudioSource:(OCSAudio *)audioSource
                      pan:(OCSParameter *)pan
{
    self = [super initWithString:[self operationName]];
    if (self) {
        asig = audioSource;
        xp = pan;
        imode = ocspi(kPanEqualPower);
    }
    return self;
}

- (void)setOptionalPanMethod:(PanMethod)panMethod {
	imode = ocspi(panMethod);
}

- (NSString *)stringForCSD {
    return [NSString stringWithFormat:
            @"%@ pan2 %@, %@, %@",
            self, asig, xp, imode];
}

@end