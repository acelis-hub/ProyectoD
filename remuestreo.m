
archivos_prefijo = 'Z';
carpeta_entrada = '/home/alejo/Desktop/Diseno/custom_keywords/Z';
carpeta_salida = '/home/alejo/Desktop/Diseno/custom_keywords/Z';
fs_nuevo = 16000;

archivos = dir(fullfile(carpeta_entrada, [archivos_prefijo, '*.wav']));
for i = 1:length(archivos)
    % Construir el nombre del archivo de entrada
    archivo_actual = archivos(i).name;
    ruta_entrada = fullfile(carpeta_entrada, archivo_actual);

    % Cargar el archivo de audio
    [x, fs_orig] = audioread(ruta_entrada);

    % Remuestrear el audio
    x_resample = resample(x, fs_nuevo, fs_orig);

    % Construir la ruta para el nuevo archivo remuestreado
    ruta_salida = fullfile(carpeta_salida, archivo_actual);

    % Guardar el nuevo audio remuestreado
    audiowrite(ruta_salida, x_resample, fs_nuevo);
end