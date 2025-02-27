import base64

def convert_binary_to_base64(file_path):
    with open(file_path, 'rb') as binary_file:
        binary_data = binary_file.read()
        base64_encoded_data = base64.b64encode(binary_data)
        base64_message = base64_encoded_data.decode('utf-8')
    return base64_message

def save_base64_to_file(base64_data, output_path):
    with open(output_path, 'w') as text_file:
        text_file.write(base64_data)

def convert_base64_to_binary(base64_file_path, output_file_path):
    with open(base64_file_path, 'r') as base64_file:
        base64_data = base64_file.read()
        binary_data = base64.b64decode(base64_data)
        with open(output_file_path, 'wb') as binary_file:
            binary_file.write(binary_data)

if __name__ == "__main__":
    file_path = 'test.7z'
    base64_output_path = 'test.txt'
    binary_output_path = 'new_test.7z'

    # Convert binary file to base64 and save to text file
    """
    base64_code = convert_binary_to_base64(file_path)
    save_base64_to_file(base64_code, base64_output_path)
    print(f"Base64 code saved to {base64_output_path}")
    """
    
    # Convert base64 text file back to binary file
    convert_base64_to_binary(base64_output_path, binary_output_path)
    print(f"Binary file created from base64 code at {binary_output_path}")
