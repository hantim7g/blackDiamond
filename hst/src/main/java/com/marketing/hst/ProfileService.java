package com.marketing.hst;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProfileService {

    private final ProfileDetailsRepository profileDetailsRepository;

    @Autowired
    public ProfileService(ProfileDetailsRepository profileDetailsRepository) {
        this.profileDetailsRepository = profileDetailsRepository;
    }

    public void saveProfileDetails(ProfileDetails profileDetails) {
        profileDetailsRepository.save(profileDetails);
    }
    public List<ProfileDetails> findByloginMailAndNewPassword(ProfileDetails profileDetails) {
    List<ProfileDetails>  pD=  profileDetailsRepository.findByloginMailAndNewPassword(profileDetails.getLoginMail(),profileDetails.getNewPassword());
    
    return pD;
    }
    


}
