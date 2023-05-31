pragma solidity ^0.5.0;



contract SocialNetwork {
    // State variable
    string public name;

    // Constructor function
    constructor () public {
        name = "Epic Social Network";
    }

    struct Post {
        uint id;
        string content;
        uint tipAmount;
        address payable author;
    }

    mapping(uint => Post) public posts;

    uint public postCount = 0;

    function createPost(string memory _content) public {
    require(bytes(_content).length > 0);
    postCount ++;
    posts[postCount] = Post(postCount, _content, 0, msg.sender);
    emit PostCreated(postCount, _content, 0, msg.sender);
    }   

    event PostCreated(
        uint id,
        string content,
        uint tipAmount,
        address payable author
    );


}

