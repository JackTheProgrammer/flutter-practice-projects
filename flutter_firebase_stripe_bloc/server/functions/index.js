const functions = require("firebase-functions");
const stripe = require("stripe")(functions.config().stripe.testkey);

const generatePrice = function(items){
    /**
     * @type {number[]}
     */
    let prices = [],
        catalog = [
            {'id': '0', price: 2.99},
            {'id': '1', price: 3.99},
            {'id': '2', price: 4.99},
            {'id': '3', price: 5.99},
            {'id': '4', price: 6.99},
        ];
    
    items.forEach(item => {
        let price = catalog.find(product => item.id === product.id).price;
        prices.push(price);
    });
    
    return parseInt(prices.reduce((pA, pB) => pA + pB) * 1000);
}

const generatedResponse = function(intent){
    switch(intent.status){
        case 'requires_action':
            return {
                clientSecret: intent.clientSecret,
                requiresAction: true,
                status: intent.status
            };
        case 'requires_payment_method':
            return {
                'error': 'Your card was denied, please add a new card'
            };
        case 'succeeded':
            console.log("Payment succeeded!!");
            return {
                clientSecret: intent.clientSecret,
                status: intent.status
            }
    }
    return {
        error: "Failed!!"
    };
}

exports.StripeEndPointMethodId = functions.https.onRequest(async (req, res) => {
    const {paymentMethodId, items, currency, useStripeSdk} = req.body;
    const orderedAmount = generatePrice(items);
    try {
        if(paymentMethodId){
            const params = {
                amount: orderedAmount,
                confirm: true,
                confirmation_method: 'manual',
                currency: currency,
                payment_method: paymentMethodId,
                use_stripe_sdk: useStripeSdk
            };
            const intent = await stripe.paymentIntents.create(params);
            console.log(`Intent: ${intent}`);
            res.send(generatedResponse(intent));
        }
        res.sendStatus(400);
    } catch (error) {
        res.send({'error': e.message});
    }
});

exports.StripeEndPointIntentId = functions.https.onRequest(async (req, res) => {
    const {paymentIntentId} = req.body;
    try {
        if(paymentIntentId){
            const intent = await stripe.paymentIntents.create(paymentIntentId);
            res.send(generatedResponse(intent));
        }
        res.sendStatus(400);
    } catch (error) {
        res.send({error: error.message});
    }
});