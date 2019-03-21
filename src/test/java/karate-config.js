function() {
    var config = { // base config JSON
        CREDS_SUITE: '',
        PROD_CRED: '',
        USER_CREDS: '',
        HR_BASE_URL:'http://reportingautomation.ascentis-dev.com:9004/api/v1/',
        PR_BASE_URL:'http://reportingautomation.ascentis-dev.com:8080/pr-report-service/',
        HR_JWT_BEARER: '',
        PR_JWT_BEARER: '',
        PR_DIRECTORY: ''
    };

    var suite_id_api = '5babd3ebf0ffdbd2a61b75d6';
    var credentialsSuiteAux = karate.call('classpath:features/utils/credentials.feature', {param_cred_id: suite_id_api});
    config.CREDS_SUITE =  credentialsSuiteAux.response.data[0];
    config.PROD_CRED = config.CREDS_SUITE.productsCreds[0];
    config.USER_CREDS = config.PROD_CRED.userCreds[0];
    config.PR_DIRECTORY = config.PROD_CRED.directoryID;
    var token = karate.callSingle('classpath:features/utils/token.feature', config);
    config.HR_JWT_BEARER = token.HR_JWT_BEARER;
    config.PR_JWT_BEARER = token.PR_JWT_BEARER;
    return config;
}